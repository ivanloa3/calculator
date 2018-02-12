//
//  ViewController.swift
//  Calculator
//
//  Created by Ivan Erwin Lopez Ansaldo on 07/02/18.
//  Copyright © 2018 Ivan Erwin Lopez Ansaldo. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var display: UILabel!
    
    var isUserTapping : Bool = false
    
    var brain = CalculatorBrain()
    
    @IBAction func appendDigit(_ sender: UIButton) {
        let digit = sender.currentTitle!
        
        if isUserTapping{
            display.text = display.text! + digit

        }else{
            display.text = "\(digit)"
            isUserTapping = true
        }
    }
    
    @IBAction func operation(_ sender: UIButton) {
        if isUserTapping { enter() }
        
        if let operation = sender.currentTitle {
            if let result = brain.performOperation(symbol: operation){
                displayValue = result
            }else{
                displayValue = 0
            }
        }
    }

    @IBAction func enter() {
        isUserTapping = false

        if let result = brain.pushOperand(operand: displayValue){
            displayValue = result
        }else{
            displayValue = 0
        }
    }
    
    var displayValue : Double{
        get {
            return NumberFormatter().number(from: display.text!)!.doubleValue
        }
        set {
            display.text = "\(newValue)"
            isUserTapping = false
        }
    }
}

