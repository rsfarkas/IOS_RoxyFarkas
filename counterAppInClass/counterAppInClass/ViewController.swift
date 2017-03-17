//
//  ViewController.swift
//  counterAppInClass
//
//  Created by Roxanne Farkas on 3/16/17.
//  Copyright © 2017 Roxanne Farkas. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var downButton: UIButton!
    @IBOutlet weak var upButton: UIButton!
    @IBOutlet weak var score: UILabel!
    
    var scoreNumber:Int = 0{
        didSet {
            score.text = "\(scoreNumber)"
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        scoreNumber = 0
    }
    
    @IBAction func upButtonPressed(sender: UIButton!){
        scoreNumber += 1
    }
    
    @IBAction func downButtonPressed(sender: UIButton!){
        scoreNumber -= 1
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

