
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
    var currentFrame = 0
    var countDown = 5.0
    
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
        zShots?.physicsBody?.velocity = CGVector(dx: 0, dy: 250)
        zShots?.physicsBody?.contactTestBitMask = 2
        zShots?.physicsBody?.mass = CGFloat(100)
        
        self.addChild(zShots!)
        
        
        zShots?.run(
            SKAction.sequence([
                SKAction.wait(forDuration: 4.0),
                SKAction.removeFromParent()
                ])
            
        )
        
        
    }
    
    
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        for  t in touches {
            
            player?.position.x = t.location(in: self).x
            
        }
        
    }
    
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        for  t in touches {
            
            // move player's X position to that point.
            player?.position.x = t.location(in: self).x
            
            // Shot!
            
            if(currentFrame % 5 == 0){
                makeZees()
            }
            
        }
    }
    
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        for  t in touches {
            
            // move player's X position to that point.
            player?.position.x = t.location(in: self).x
            
            
        }
        
    }
    
    
    func updateLabel(){
        gameScore = self.childNode(withName: "gameScore") as? SKLabelNode
        gameScore?.text = "Score: " + "\(currentScore)"
        
    }
    
    
    override func update(_ currentTime: TimeInterval) {
        currentFrame += 1
        if (currentScore >= 100){
            endGame()
        }
        
    }
    
    func endGame(){
        SoundManager.instance.play(soundFile: "background")
        UserDefaults.standard.set(currentScore, forKey: "lastScore")
        let pastTopScore = UserDefaults.standard.value(forKey: "topScore") as? Int ?? 0
        
        if currentScore > pastTopScore {
            UserDefaults.standard.set(currentScore, forKey: "topScore")
        }
        
        let nextScene = SKScene(fileNamed: "gameOver")
        nextScene?.scaleMode = .aspectFit
        self.view?.presentScene(nextScene)
    }
    
    func loser(){
        SoundManager.instance.play(soundFile: "background")
        UserDefaults.standard.set(currentScore, forKey: "lastScore")
        let pastTopScore = UserDefaults.standard.value(forKey: "topScore") as? Int ?? 0
        
        if currentScore > pastTopScore {
            UserDefaults.standard.set(currentScore, forKey: "topScore")
        }
        
        let nextScene = SKScene(fileNamed: "loser")
        nextScene?.scaleMode = .aspectFit
        self.view?.presentScene(nextScene)
    }
    
    
    
    
    func didBegin(_ contact: SKPhysicsContact) {
        
        
        if ((contact.bodyA.contactTestBitMask == 2)  && (contact.bodyB.contactTestBitMask == 1)){
            whenZhitsSheep(zshot: contact.bodyA.node)
        }
        
        if ((contact.bodyB.contactTestBitMask == 2)  && (contact.bodyA.contactTestBitMask == 1)){
            whenZhitsSheep(zshot: contact.bodyB.node)
        }
        
        if(contact.bodyA.contactTestBitMask == 1) && (contact.bodyB.contactTestBitMask == 7){
            updateLabel()
            loser()
        }
        
        if(contact.bodyA.contactTestBitMask == 7) && (contact.bodyB.contactTestBitMask == 1){
            
            updateLabel()
            loser()
        }
        
    }
    
    func whenZhitsSheep(zshot: SKNode?) {
        
        SoundManager.instance.play(soundFile: "bah1")
        zshot?.removeFromParent()
        currentScore = currentScore + 1
        updateLabel()
    }
    
    
    
}
