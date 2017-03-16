//
//  ViewController.swift
//  ApplicationBasics
//
//  Created by Roxanne Farkas on 3/15/17.
//  Copyright © 2017 Roxanne Farkas. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var basicLabel: UILabel!
    
    @IBOutlet weak var myLabel: UILabel!
    
    @IBOutlet weak var textLabel: UILabel!
    
    @IBOutlet weak var myTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //myTextField.delegate = self
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    @IBAction func didTapButton(_ sender: AnyObject) {
        let name = myTextField.text!
        textLabel.text = "Hi \(name)!"
        myTextField.resignFirstResponder()
    }
    
    @IBAction func tapMe(_ sender: Any) {
        myLabel.text = "Changed with Code!"
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        view.endEditing(true)
    }
    
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        myTextField.resignFirstResponder()
        return false
    }


    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

