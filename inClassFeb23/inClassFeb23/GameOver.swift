//
//  GameOver.swift
//  inClassFeb23
//
//  Created by Roxanne Farkas on 2/23/17.
//  Copyright © 2017 Roxanne Farkas. All rights reserved.
//

import SpriteKit
import GameplayKit

class GameOver: SKScene {
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        callMenu()
    }
    
    //definition
    func callMenu(){
        // Load the SKScene from 'GameScene.sks'
        let scene = SKScene(fileNamed: "Menu")
        // Set the scale mode to scale to fit the window
        scene?.scaleMode = .aspectFill
        
        // Present the scene
        view?.presentScene(scene)
        
    }

    
}
