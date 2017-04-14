//
//  ViewController.swift
//  AutoLayout1
//
//  Created by Roxanne Farkas on 4/6/17.
//  Copyright © 2017 Roxanne Farkas. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var inputLabel: UILabel!
    @IBOutlet weak var outputLabel: UILabel!
    @IBOutlet weak var inputBar: UIView!
    @IBOutlet weak var outputBar: UIView!

    let buttonModels = [
        "C", "**", "*", "/", "7", "8", "9", "-", "4", "5", "6", "+", "1", "2", "3", "=", "0"
    ]

    var lastTyped = ""
    var hasBegunTyping = false

    lazy var buttons: [UIButton] = {
        return self.buttonModels.map { (string: String) -> UIButton in
           let calcButton = UIButton()
            calcButton.setTitle(string, for: .normal)
            calcButton.addTarget(self, action: #selector(didPressButton(button:)), for: .touchUpInside)
            return calcButton
        }
    }()

    func didPressButton(button: UIButton) {
        guard let input = button.titleLabel?.text else {
            return
        }

        if !hasBegunTyping {
            inputLabel.text = ""
            outputLabel.text = ""
            hasBegunTyping = true

        }

        if !input.isOperator() && lastTyped == "=" {
            inputLabel.text = ""
        }

        if input == "=" {
            let currentLabelVal = inputLabel.text
            evaluate()
            inputLabel.text = currentLabelVal! + "  "
        } else if input == "C"{
            inputLabel.text = ""
            outputLabel.text = ""
        } else {
            inputLabel.text = (inputLabel.text ?? "") + input
        }

         lastTyped = input

    }

    func evaluate() {
        let output = (inputLabel.text ?? "")
        guard output.trimmingCharacters(in: .whitespaces) != "" else {
            return
        }

        guard output != "" else {
            return
        }

        print ("output: \(output)")
        let exp = NSExpression(format: inputLabel.text ?? "")
        guard let result: Double = exp.expressionValue(with: nil, context: nil) as? Double else {
            return
        }
        print(result)
        outputLabel.text = "\(result)"
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        var previousView: UIView = view
        var topAlign: UIView = outputBar

        for (buttonIndex, button) in buttons.enumerated() {
            // must be done to use autolayout in code.
            button.translatesAutoresizingMaskIntoConstraints = false
            view.addSubview(button)

            if buttonIndex == 15 {
                button.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 4/15)
                    .isActive = true
            } else {
                button.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 2/15)
                    .isActive = true
            }

            if buttonIndex == 16 {
                button.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.75)
                    .isActive = true
            } else {
                button.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.25)
                    .isActive = true
            }

            if buttonIndex % 4 == 0 {
                button.leadingAnchor.constraint(equalTo: view.leadingAnchor)
                    .isActive = true
                if buttonIndex != 0 {
                    topAlign = previousView
                }

                if buttonIndex == 16 {
                    topAlign = buttons[14]
                }

            } else {
                button.leadingAnchor.constraint(equalTo: previousView.trailingAnchor)
                    .isActive = true
            }

            button.topAnchor.constraint(equalTo: topAlign.bottomAnchor)
                .isActive = true
            button.backgroundColor = UIColor(red:0.20, green:0.20, blue:0.20, alpha:1.0)
            if buttonIndex == 15 {
                button.backgroundColor = .yellow
                button.setTitleColor(.gray, for: .normal)
                button.titleLabel!.font =  UIFont(name: "Helvetica Neue", size: 22)
            }

            button.layer.borderColor = UIColor.black.cgColor
            button.titleLabel!.font =  UIFont(name: "Helvetica Neue", size: 20)
            button.layer.borderWidth = 1
            previousView = button
        }

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

extension String {
    func isOperator() -> Bool {
        return self == "+" || self == "-" || self == "*" || self == "**" || self == "/"
    }
}
