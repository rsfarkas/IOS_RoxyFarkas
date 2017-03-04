//
//  menuScreen.swift
//  SheepCounter
//
//  Created by Roxanne Farkas on 2/17/17.
//  Copyright © 2017 newschool. All rights reserved.
//

import SpriteKit
import GameplayKit

import UIKit


class menuScene: SKScene {

    var button: SKSpriteNode?
    var LabelLastScore : SKLabelNode?
    var LabelTopScore: SKLabelNode?
    
    //getter inside. this is a computed variable.
    var lastScore: Int {
        return UserDefaults.standard.value(forKey: "lastScore") as? Int ?? 0
       
    }
    
    var topScore: Int {
         return UserDefaults.standard.value(forKey: "topScore") as? Int ?? 0
    }
    
    override func didMove(to view: SKView){
        SoundManager.instance.play(soundFile: "background")

        LabelLastScore = self.childNode(withName: "LabelLastScore") as? SKLabelNode
        LabelLastScore?.text = "Last Score: " + "\(lastScore)"
        
        LabelTopScore = self.childNode(withName: "LabelTopScore") as? SKLabelNode
        LabelTopScore?.text = "Top Score: " + "\(topScore)"
    }

    //when play button pressed
    //switch view to GameScene.sks
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        for touch in touches {
            let location = touch.location(in: self)
            let node: SKNode = self.atPoint(location)
            if node.name == "playButton"{
                SoundManager.instance.play(soundFile: "bah1")
                let nextScene = SKScene(fileNamed: "GameScene")
                nextScene?.scaleMode = .aspectFit
                self.view?.presentScene(nextScene)
            }
            
            
        }
    }
    
    
    
    
    
}
