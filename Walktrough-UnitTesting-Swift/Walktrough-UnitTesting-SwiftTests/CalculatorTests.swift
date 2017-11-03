//
//  CalculatorTests.swift
//  Walktrough-UnitTesting-SwiftTests
//
//  Created by MCS Devices on 11/2/17.
//  Copyright © 2017 Mobile Consulting Solutions. All rights reserved.
//

import XCTest
@testable import Walktrough_UnitTesting_Swift

class CalculatorTests: XCTestCase {
    
    var brain: CalculatorBrain?
    
    override func setUp() {
        super.setUp()
        brain = CalculatorBrain()
    }
    
    func testAddition()
    {
        self.brain?.pushOperand(operand: Double("21")!)
        self.brain?.pushOperand(operand: Double("63")!)
        let result = self.brain?.performOperation(operation: "+")
        XCTAssertTrue(result==84, "Addition Fail");
    }

    func testSubtraction()
    {
        self.brain?.pushOperand(operand: Double("30")!)
        self.brain?.pushOperand(operand: Double("20")!)
        let result = self.brain?.performOperation(operation: "-")
        XCTAssertTrue(result==10, "Subtraction Fail");
    }
    
    func testProduction()
    {
        self.brain?.pushOperand(operand: Double("3")!)
        self.brain?.pushOperand(operand: Double ("5")!)
        let result = self.brain?.performOperation(operation: "*");
        XCTAssertTrue(result==15, "Production Fail");
    }
    
    func testDivision()
    {
        self.brain?.pushOperand(operand: Double("77")!)
        self.brain?.pushOperand(operand: Double("7")!)
        let result = self.brain?.performOperation(operation: "/")
        XCTAssertTrue(result==11, "Division Fail");
    }
    
    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }
    
    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }
    
}
