//
//  ViewController.swift
//  methods
//
//  Created by Roxanne Farkas on 3/13/17.
//  Copyright © 2017 Roxanne Farkas. All rights reserved.
//

import UIKit


class ViewController: UIViewController {

    @IBAction func byeButton(_ sender: Any) {
         say(message: "Goodbye")
    }
    
    @IBAction func hiButton(_ sender: Any) {
        say(message: "Hello")
    }
    
    func say(message:String){
        emptyLabel.text = message
    }
    
    @IBOutlet weak var emptyLabel: UILabel!
    
    @IBOutlet weak var hiLabel: UILabel!
    
    
    @IBAction func didHitAlien(_ sender: Any) {
            self.didScore(5)
    }
    
    @IBAction func didHitShip(_ sender: Any) {
        self.didScore(1)
    }
    
    var score:Int = 0
    //underscore means not going to call out parameter name. this is less code but more confusing.
    func didScore(_ points:Int) {
        score = score + points
        hiLabel.text = "Score: \(score)"
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //self.didScore(1)
    }
    
    @IBOutlet weak var hitShip: UIButton!

    @IBOutlet weak var hitAlien: UIButton!
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}
