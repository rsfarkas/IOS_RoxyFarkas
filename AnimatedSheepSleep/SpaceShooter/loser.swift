//
//  loser.swift
//  SheepCounter
//
//  Created by Roxanne Farkas on 2/24/17.
//  Copyright © 2017 newschool. All rights reserved.
//

//
//  gameOver.swift
//  SheepCounter
//
//  Created by Roxanne Farkas on 2/17/17.
//  Copyright © 2017 newschool. All rights reserved.
//


import SpriteKit
import GameplayKit

import UIKit

class loser: SKScene {
    
    var currentScore = 0
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        let nextScene = SKScene(fileNamed: "menuScene")
        nextScene?.scaleMode = .aspectFit
        self.view?.presentScene(nextScene)
    }
}

