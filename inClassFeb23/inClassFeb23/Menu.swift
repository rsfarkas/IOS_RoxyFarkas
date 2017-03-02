//
//  Menu.swift
//  inClassFeb23
//
//  Created by Roxanne Farkas on 2/23/17.
//  Copyright © 2017 Roxanne Farkas. All rights reserved.
//

import SpriteKit
import GameplayKit

//Globals outside of an Object
var topScore = 0
var currentScore = 0
var lastScore = 0

class Menu: SKScene {
    
    var LabelLastScore : SKLabelNode?
    var LabelTopScore: SKLabelNode?
    
    override func didMove(to view: SKView){
        LabelLastScore = self.childNode(withName: "LabelLastScore") as? SKLabelNode
        LabelLastScore?.text = "Last Score: " + "\(lastScore)"

        LabelTopScore = self.childNode(withName: "LabelTopScore") as? SKLabelNode
        LabelTopScore?.text = "Top Score: " + "\(topScore)"
    }
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
       callGameScene()
    }
    
    //definition
    func callGameScene(){
        // Load the SKScene from 'GameScene.sks'
        let scene = SKScene(fileNamed: "GameScene")
            // Set the scale mode to scale to fit the window
            scene?.scaleMode = .aspectFill
            
            // Present the scene
            view?.presentScene(scene)

    }
    
}
