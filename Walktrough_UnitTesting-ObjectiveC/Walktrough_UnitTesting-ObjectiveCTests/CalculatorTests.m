//
//  CalculatorTests.m
//  Walktrough_UnitTesting-ObjectiveCTests
//
//  Created by MCS Devices on 11/2/17.
//  Copyright © 2017 Mobile Consulting Solutions. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "CalculatorBrain.h"

@interface CalculatorTests : XCTestCase

@property (nonatomic,strong) CalculatorBrain * brain;

@end

@implementation CalculatorTests


- (void)setUp {
    [super setUp];
    _brain = [[CalculatorBrain alloc] init];
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)testAddition
{
    [self.brain pushOperand:[@"100" doubleValue]];
    [self.brain pushOperand:[@"90" doubleValue]];
    double result = [self.brain performOperation:@"+"];
    XCTAssertTrue(result==190, @"Addition Fail");
}

- (void)testSubtraction
{
    [self.brain pushOperand:[@"100" doubleValue]];
    [self.brain pushOperand:[@"90" doubleValue]];
    double result = [self.brain performOperation:@"-"];
    XCTAssertTrue(result==10, @"Subtraction Fail");
}
- (void)testProduction
{
    [self.brain pushOperand:[@"3" doubleValue]];
    [self.brain pushOperand:[@"5" doubleValue]];
    double result = [self.brain performOperation:@"*"];
    XCTAssertTrue(result==15, @"Production Fail");
}
- (void)testDivision
{
    [self.brain pushOperand:[@"77" doubleValue]];
    [self.brain pushOperand:[@"7" doubleValue]];
    double result = [self.brain performOperation:@"/"];
    XCTAssertTrue(result==11, "Division Fail");
}

- (void)testExample {
    // This is an example of a functional test case.
    // Use XCTAssert and related functions to verify your tests produce the correct results.
}

- (void)testPerformanceExample {
    // This is an example of a performance test case.
    [self measureBlock:^{
        // Put the code you want to measure the time of here.
    }];
}

@end
