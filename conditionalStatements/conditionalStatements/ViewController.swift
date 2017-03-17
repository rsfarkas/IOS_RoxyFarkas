//
//  ViewController.swift
//  conditionalStatements
//
//  Created by Roxanne Farkas on 3/16/17.
//  Copyright © 2017 Roxanne Farkas. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var name:String!
    
    var clicks:Int = 0
    
    @IBAction func clickButton(_ sender: Any) {
        clicks = clicks + 1
        if clicks >= 10 {
            clickLabel.text = "You win!"
        }
    }
    
    @IBOutlet weak var clickLabel: UILabel!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        name = "Todd"
        //print(name!)
        
//        guard let newName = name else {
//            return
//        }
//        print("name is \(newName)")
    
    
        
        
//        var score:Int = 100
//        if(score < 50000){
//            print("give an extra life")
//        }
//        else{
//            print("no extra life")
//        }
//        ------------------------------------
//        let userIsLoggedIn:Bool = true
//        
//        if userIsLoggedIn {
//            print("give user access!")
//        }
//        else {
//            print("no access for you!")
//        }
//        ---------------------------------------
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

