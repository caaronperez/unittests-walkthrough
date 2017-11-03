//
//  Walktrough_UnitTesting_SwiftTests.swift
//  Walktrough-UnitTesting-SwiftTests
//
//  Created by MCS Devices on 11/2/17.
//  Copyright © 2017 Mobile Consulting Solutions. All rights reserved.
//

import XCTest
@testable import Walktrough_UnitTesting_Swift

class Walktrough_UnitTesting_SwiftTests: XCTestCase {
    
    var brain: CalculatorBrain?
    
    override func setUp() {
        super.setUp()
        brain = CalculatorBrain()
    }
    
    func testAddition()
    {
        
    }
    
    
    override func tearDown() {
        super.tearDown()
    }
    
    func testExample() {
       
    }
    
    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }
    
}
