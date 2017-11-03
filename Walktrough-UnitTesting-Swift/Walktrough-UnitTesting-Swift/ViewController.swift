//
//  ViewController.swift
//  Walktrough-UnitTesting-Swift
//
//  Created by MCS Devices on 11/2/17.
//  Copyright © 2017 Mobile Consulting Solutions. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var oneButton: UIButton!
    @IBOutlet weak var twoButton: UIButton!
    @IBOutlet weak var threeButton: UIButton!
    @IBOutlet weak var fourButton: UIButton!
    @IBOutlet weak var fiveButton: UIButton!
    @IBOutlet weak var sixButton: UIButton!
    @IBOutlet weak var sevenButton: UIButton!
    @IBOutlet weak var eightButton: UIButton!
    @IBOutlet weak var nineButton: UIButton!
    @IBOutlet weak var dotButton: UIButton!
    @IBOutlet weak var zeroButton: UIButton!
    @IBOutlet weak var clearButton: UIButton!
    @IBOutlet weak var plusButton: UIButton!
    @IBOutlet weak var substractButton: UIButton!
    @IBOutlet weak var divideButton: UIButton!
    @IBOutlet weak var multiplyButton: UIButton!
    @IBOutlet weak var enterButton: UIButton!
    @IBOutlet weak var resultLabel: UILabel!
    @IBOutlet weak var inputLabel: UILabel!
    
    
    var dotNotation:Bool?
    var userIsInTheMiddleOfTyping:Bool?
    var firstEntered: Bool?
    var brain: CalculatorBrain?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        layoutComponents()
        dotNotation = false;
        userIsInTheMiddleOfTyping = false;
        firstEntered = false;
        brain = CalculatorBrain()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    func layoutComponents() {
        inputLabel.layer.cornerRadius = 9;
        inputLabel.layer.masksToBounds = true;
        resultLabel.layer.cornerRadius = 9;
        resultLabel.layer.masksToBounds = true;
        oneButton.layer.cornerRadius = 7;
        oneButton.layer.masksToBounds = true;
        twoButton.layer.cornerRadius = 7;
        twoButton.layer.masksToBounds = true;
        threeButton.layer.cornerRadius = 7;
        threeButton.layer.masksToBounds = true;
        fourButton.layer.cornerRadius = 7;
        fourButton.layer.masksToBounds = true;
        fiveButton.layer.cornerRadius = 7;
        fiveButton.layer.masksToBounds = true;
        sixButton.layer.cornerRadius = 7;
        sixButton.layer.masksToBounds = true;
        sevenButton.layer.cornerRadius = 7;
        sevenButton.layer.masksToBounds = true;
        eightButton.layer.cornerRadius = 7;
        eightButton.layer.masksToBounds = true;
        nineButton.layer.cornerRadius = 7;
        nineButton.layer.masksToBounds = true;
        zeroButton.layer.cornerRadius = 7;
        zeroButton.layer.masksToBounds = true;
        dotButton.layer.cornerRadius = 7;
        dotButton.layer.masksToBounds = true;
        clearButton.layer.cornerRadius = 7;
        clearButton.layer.masksToBounds = true;
        plusButton.layer.cornerRadius = 7;
        plusButton.layer.masksToBounds = true;
        substractButton.layer.cornerRadius = 7;
        substractButton.layer.masksToBounds = true;
        divideButton.layer.cornerRadius = 7;
        divideButton.layer.masksToBounds = true;
        multiplyButton.layer.cornerRadius = 7;
        multiplyButton.layer.masksToBounds = true;
        enterButton.layer.cornerRadius = 7;
        enterButton.layer.masksToBounds = true;
    }

    @IBAction func digitPressed(sender: UIButton!){
    
        if let digit = sender.currentTitle {
    
            if(!(self.dotNotation! && digit == "."))
            {
                if(digit == "."){ self.dotNotation=true }
                
                if(self.userIsInTheMiddleOfTyping)!, let i = self.inputLabel.text {
                    self.inputLabel.text = "\(i)\(digit)"
                }
                else {
                    self.inputLabel.text = digit;
                    self.userIsInTheMiddleOfTyping=true;
                }
            }
        }
    }
    
    @IBAction func operationPressed(sender: UIButton!){
        if(sender.currentTitle == "C")
        {
            self.inputLabel.text = "0"
            self.resultLabel.text = "0"
            self.brain = CalculatorBrain()
            self.dotNotation = false;
            self.userIsInTheMiddleOfTyping = false
            self.firstEntered = false
        }
        else
        {
            if let s = sender.currentTitle, let i = self.inputLabel.text, let r = self.resultLabel.text {
                
                if(self.userIsInTheMiddleOfTyping)! {
                    self.enterPressed(sender: nil)
                }
                
                self.inputLabel.text = "\(i) "
                self.resultLabel.text = "\(r)\(i)\(s)"
                
                
                if let result = self.brain?.performOperation(operation: s){
                    let resultString = "\(result)"
                    self.inputLabel.text = resultString;
                }
            }
        }
    }
    
    @IBAction func enterPressed(sender: UIButton!){
        
        if let operand = Double(self.inputLabel.text!){
            self.brain?.pushOperand(operand: operand)
        
            if (self.firstEntered)!, let r = self.resultLabel.text, let i = self.inputLabel.text
            {
                self.resultLabel.text = "\(r) "
                self.resultLabel.text = "\(r)\(i)"
            }
            else if let i = self.inputLabel.text {
                self.resultLabel.text = i
                self.inputLabel.text = "0"
            }
            self.userIsInTheMiddleOfTyping = false
            self.dotNotation = false
            self.firstEntered = true
        }
    }

}

