//
//  GameScene.swift
//  SheepCounter
//
//  Created by Roxanne Farkas on 2/11/17.

import SpriteKit
import GameplayKit

//set global variable


class GameScene: SKScene, SKPhysicsContactDelegate {
    // "global to object"

    var gameScore: SKLabelNode?
    var defeatedLabel: SKLabelNode?
    
    var currentScore = 0
    
    //properties, define must "?"
    var player: SKSpriteNode?  //optional, "nil"
    var enemy: SKSpriteNode? //
    var laser:SKShapeNode?
    var loserzone:SKSpriteNode?
    let enemyCategory:UInt32 = 0b1 << 2
    let itemCategory:UInt32 = 0b1 << 3
    //var highScore: SKLabelNode?

    var zShots: SKSpriteNode?
  
    override func didMove(to view: SKView) {
        self.physicsWorld.contactDelegate = self
        
        // as is "casting"
        player = self.childNode(withName: "player") as! SKSpriteNode?
        enemy = self.childNode(withName: "sheep") as! SKSpriteNode?
        laser = self.childNode(withName: "laser") as? SKShapeNode
        
        zShots = self.childNode(withName: "zShots") as? SKSpriteNode
        
        updateLabel()
    }
    
    
    
    func makeZees(){
        zShots = SKSpriteNode()
        zShots?.size = CGSize(width: 32, height: 32)
        zShots?.texture = SKTexture(image: #imageLiteral(resourceName: "zShot"))
        
        zShots?.position = (player?.position)!
        
        zShots?.physicsBody = SKPhysicsBody(circleOfRadius: 25)
        zShots?.physicsBody?.affectedByGravity = false
        zShots?.physicsBody?.velocity = CGVector(dx: 0, dy: 350)
        zShots?.physicsBody?.contactTestBitMask = 2
        
        self.addChild(zShots!)
        
    }
    
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        makeZees()
        
        for  t in touches {
            //print("t= \(t.location(in: self))")
            
            player?.position.x = t.location(in: self).x
            
        }
        
    }
    
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
    
        for  t in touches {

            // move player's X position to that point.
            player?.position.x = t.location(in: self).x
            
            // Shot!
            makeZees()
            
        }
    }
    
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        for  t in touches {
            
            // move player's X position to that point.
            player?.position.x = t.location(in: self).x
            
            // Shot!
            makeZees()
            
        }
        
    }
    
    
    func updateLabel(){
        print("score update")
        gameScore = self.childNode(withName: "gameScore") as? SKLabelNode
        gameScore?.text = "Score: " + "\(currentScore)"

    }
    
    
    override func update(_ currentTime: TimeInterval) {
        if (currentScore >= 100){
            endGame()
        }
    }

    func endGame(){
        UserDefaults.standard.set(currentScore, forKey: "lastScore")
        let pastTopScore = UserDefaults.standard.value(forKey: "topScore") as? Int ?? 0
        
        if currentScore > pastTopScore {
            UserDefaults.standard.set(currentScore, forKey: "topScore")
        }
        
        let nextScene = SKScene(fileNamed: "gameOver")
        print("endingGame")
        nextScene?.scaleMode = .aspectFit
        self.view?.presentScene(nextScene)
    }
    
    func loser(){
        UserDefaults.standard.set(currentScore, forKey: "lastScore")
        let pastTopScore = UserDefaults.standard.value(forKey: "topScore") as? Int ?? 0
        
        if currentScore > pastTopScore {
            UserDefaults.standard.set(currentScore, forKey: "topScore")
        }
        
        let nextScene = SKScene(fileNamed: "loser")
        print("losingGame")
        nextScene?.scaleMode = .aspectFit
        self.view?.presentScene(nextScene)
    }
    
    
    
    
    func didBegin(_ contact: SKPhysicsContact) {

        if (contact.bodyA.contactTestBitMask == 1){
            currentScore = currentScore + 1
            updateLabel()
            
        }
        
        if (contact.bodyB.contactTestBitMask == 1){
            currentScore = currentScore + 1
            updateLabel()
        }
        
        if ((contact.bodyA.contactTestBitMask == 2) || (contact.bodyA.contactTestBitMask == 3)){
            contact.bodyA.node?.removeFromParent()
        }
        
            if(contact.bodyA.contactTestBitMask == 7) && (contact.bodyB.contactTestBitMask == 1){
                currentScore = currentScore + 0
                updateLabel()
                loser()
     }

        
    }

}
