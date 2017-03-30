//
//  ViewController.swift
//  MyCalcRoxanneFarkas
//
//  Created by Roxanne Farkas on 3/30/17.
//  Copyright © 2017 Roxanne Farkas. All rights reserved.
//

import UIKit

enum modes {
    case not_set
    case addition
    case subtraction
}

class ViewController: UIViewController {
    
    var labelString:String = "0"
    var currentMode:modes = .not_set
    var savedNum:Int = 0
    var lastButtonWasMode:Bool = false
    
    @IBOutlet weak var calcLabel: UILabel!

    @IBAction func didPressNumber(_ sender: UIButton) {
    }
    
    @IBAction func didPressPlus(_ sender: UIButton) {
    }
    
    @IBAction func didPressEquals(_ sender: UIButton) {
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    func updateText(){
        
    }
    func changeMode(newMode:modes){
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

