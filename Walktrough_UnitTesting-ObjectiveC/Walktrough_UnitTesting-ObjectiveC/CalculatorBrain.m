//
//  CalculatorBrain.m
//  Walktrough_UnitTesting-ObjectiveC
//
//  Created by MCS Devices on 11/2/17.
//  Copyright © 2017 Mobile Consulting Solutions. All rights reserved.
//

#import "CalculatorBrain.h"

@interface CalculatorBrain()

@property (nonatomic, strong) NSMutableArray * operandStack;

@end

@implementation CalculatorBrain

@synthesize operandStack = _operandStack;

- (NSMutableArray*) operandStack
{
    if(_operandStack==nil)
        _operandStack=[[NSMutableArray alloc]init];
    
    return _operandStack;
}

-(void) setOperandStack:(NSMutableArray *)operandStack
{
    _operandStack=operandStack;
}

- (void) pushOperand:(double) operand
{
    [self.operandStack addObject:[NSNumber numberWithDouble:operand]];
}

- (double)popOperand
{
    NSNumber*operandObject = [self.operandStack lastObject];
    
    if(operandObject!=nil)
        [self.operandStack removeLastObject];
    
    return [operandObject doubleValue];
}

-(double)performOperation:(NSString*)operation{
    double result =0;
    
    if ([operation isEqualToString:@"+"])
    {
        result=[self popOperand]+[self popOperand];
    }
    else if([operation isEqualToString:@"*"])
    {
        result=[self popOperand]*[self popOperand];
    }
    else if([operation isEqualToString:@"-"])
    {
        double operand2= [self popOperand];
        result =[self popOperand]-operand2;
    }
    else if([operation isEqualToString:@"/"])
    {
        double operand2= [self popOperand];
        result =[self popOperand]/operand2;
    }
    
    [self pushOperand:result];
    return result;
}

@end
