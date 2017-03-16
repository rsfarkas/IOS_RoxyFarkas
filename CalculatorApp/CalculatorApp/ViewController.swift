//
//  ViewController.swift
//  CalculatorApp
//
//  Created by Roxanne Farkas on 3/13/17.
//  Copyright © 2017 Roxanne Farkas. All rights reserved.
//

import UIKit

enum modes {
    case addition
    case subtraction
    case multiplication
    case no_mode_set
}

class ViewController: UIViewController {
    
    @IBOutlet weak var label: UILabel!
   
    var name:String = "Roxy"
    

    override func viewDidLoad() {
        super.viewDidLoad()
        let score:Int = 10
        label.text = "\(score)"
        // Do any additional setup after loading the view, typically from a nib.
        name = "Roxanne"
        print(name)
        
        var mode:modes = .no_mode_set
        mode = .addition
        mode = .subtraction
        mode = .multiplication
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

