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
        if(lastButtonWasMode){
            lastButtonWasMode = false
            labelString = "0"
        }
        let stringValue:String? = sender.titleLabel?.text
        labelString = labelString.appending(stringValue!)
        
        calcLabel.text = labelString
        
        updateText()
    }
    
    @IBAction func didPressPlus(_ sender: UIButton) {
        changeMode(newMode: .addition)
    }
    
    @IBAction func didPressEquals(_ sender: UIButton) {
        guard let labelInt:Int = Int(labelString) else{
            return
        }
        if(currentMode == .not_set || lastButtonWasMode) {
            return
        }
        if(currentMode == .addition){
            savedNum += labelInt
        }
        if(currentMode == .subtraction){
            savedNum -= labelInt
        }
        
        currentMode = .not_set
        labelString = "\(savedNum)"
        updateText()
    }
    
    @IBAction func didPressClear(_ sender: UIButton) {
       labelString = "0"
       currentMode = .not_set
       savedNum = 0
       lastButtonWasMode = false
        
    updateText()
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    func updateText(){
        guard let labelInt:Int = Int(labelString) else{
            return
        }
        if (currentMode == .not_set) {
            savedNum = labelInt
        }
        
        calcLabel.text = "\(labelInt)"
        
        calcLabel.text = labelString
        
    }
    
    func changeMode(newMode:modes){
        if (savedNum == 0) {
            return
        }
        
        currentMode = newMode
        lastButtonWasMode = true
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

