//
//  GameScene.swift
//  inClassFeb23
//
//  Created by Roxanne Farkas on 2/23/17.
//  Copyright © 2017 Roxanne Farkas. All rights reserved.
//

import SpriteKit
import GameplayKit

class GameScene: SKScene, SKPhysicsContactDelegate {

    var gameScore: SKLabelNode?
    var boss: SKSpriteNode?
    var bounds: SKSpriteNode?
    
    override func didMove(to view: SKView){
        
        //setup self as contactDelegate
        self.physicsWorld.contactDelegate = self
    
        boss = self.childNode(withName: "boss") as! SKSpriteNode?
        bounds = self.childNode(withName: "bounds") as! SKSpriteNode?
        
        gameScore = self.childNode(withName: "gameScore") as? SKLabelNode
        gameScore?.text = "Score: " + "\(currentScore)"
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        currentScore = currentScore + 1
         gameScore?.text = "Score: " + "\(currentScore)"
    }
    
    func setUpGame(){
        print("hello world")
    }

    
    override func update(_ currentTime: TimeInterval) {
        if (currentScore >= 10){
            callGameOver()
        }
    }
    
    //definition
    func callGameOver(){
        // Load the SKScene from 'GameScene.sks'
        let scene = SKScene(fileNamed: "GameOver")
        // Set the scale mode to scale to fit the window
        scene?.scaleMode = .aspectFill
        
        // Present the scene
        view?.presentScene(scene)
        
    }
    
    func didBegin(_ contact: SKPhysicsContact) {
        //if((contact.bodyA.node?.name == "bounds") || (contact.bodyB.node?.name == "bounds")){
          //  callGameOver()
        //}
        
        if((contact.bodyA.contactTestBitMask == 2) || (contact.bodyB.contactTestBitMask == 2)){
            callGameOver()
        }
    }
}
