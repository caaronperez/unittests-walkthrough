//
//  CalculatorBrain.swift
//  Walktrough-UnitTesting-Swift
//
//  Created by MCS Devices on 11/2/17.
//  Copyright © 2017 Mobile Consulting Solutions. All rights reserved.
//

import UIKit

class CalculatorBrain: NSObject {

    
    var operandStack: NSMutableArray? = NSMutableArray()
    
    func setOperandStack (operandStack: NSMutableArray)
    {
        self.operandStack=operandStack
    }
    
    func pushOperand(operand: Double)
    {
        self.operandStack?.add(operand)
    }
    
    func popOperand() -> Double
    {
        if let operandObject = self.operandStack?.lastObject{
            
            if(operandObject != nil){
                self.operandStack?.removeLastObject()
            }
            return operandObject as! Double
            
        } else {
            return 0
        }
       
    }
    
    func performOperation(operation: String) -> Double {
    
        var result: Double = 0;
        
        if operation == "+"
        {
            result = popOperand() + popOperand()
        }
        else if operation == "*"
        {
            result = popOperand() * popOperand()
        }
        else if operation == "-"
        {
            let operand2 = popOperand()
            result = popOperand() - operand2 ;
        }
        else if operation == "/"
        {
            let operand2 = popOperand()
            result = popOperand()/operand2;
        }
        self.pushOperand(operand: result)
        return result;
    }

    
}
