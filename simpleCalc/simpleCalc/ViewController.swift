//
//  ViewController.swift
//  simpleCalc
//
//  Created by Roxanne Farkas on 3/16/17.
//  Copyright © 2017 Roxanne Farkas. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var myNumber = 0
    var mySecondNumber = 0
    var result = 0
    var addTwoNumbers = false
    
    @IBOutlet weak var valueLabel: UILabel!
    
    @IBAction func pressedOne(_ sender: UIButton) {
    
        myNumber = 1
        myLabelUpdate(someNumber: myNumber)

    }
    
    
    @IBAction func pressedTwo(_ sender: UIButton) {
        
        myNumber = 2
        myLabelUpdate(someNumber: myNumber)

    }
    
    
    @IBAction func pressedThree(_ sender: UIButton) {
        
        myNumber = 3
        myLabelUpdate(someNumber: myNumber)

    }
    
    
    @IBAction func pressedFour(_ sender: UIButton) {
        
        myNumber = 4
        myLabelUpdate(someNumber: myNumber)

    }
    
    
    @IBAction func pressedFive(_ sender: UIButton) {
        
        myNumber = 5
        myLabelUpdate(someNumber: myNumber)

    }
    
    @IBAction func pressed6(_ sender: UIButton) {
        
        myNumber = 6
        
        if addTwoNumbers{
            mySecondNumber = 8
        }
        
        myLabelUpdate(someNumber: myNumber)
    }
    
    @IBAction func pressedPlus(_ sender: UIButton) {
        addTwoNumbers = true
    }
    
    @IBAction func pressedEquals(_ sender: UIButton) {
        
        result = myNumber + mySecondNumber
        myLabelUpdate(someNumber: result)
    }
    
    func myLabelUpdate(someNumber: Int){
        valueLabel.text = String(someNumber)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

