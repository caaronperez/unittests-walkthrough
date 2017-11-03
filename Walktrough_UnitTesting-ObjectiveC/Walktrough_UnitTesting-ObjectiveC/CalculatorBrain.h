//
//  CalculatorBrain.h
//  Walktrough_UnitTesting-ObjectiveC
//
//  Created by MCS Devices on 11/2/17.
//  Copyright © 2017 Mobile Consulting Solutions. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CalculatorBrain : NSObject

-(void) pushOperand:(double) operand;
-(double) performOperation:(NSString*)operation;
-(double) popOperand;

@end
