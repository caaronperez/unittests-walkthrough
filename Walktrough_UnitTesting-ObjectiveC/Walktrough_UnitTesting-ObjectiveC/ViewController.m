//
//  ViewController.m
//  Walktrough_UnitTesting-ObjectiveC
//
//  Created by MCS Devices on 11/2/17.
//  Copyright © 2017 Mobile Consulting Solutions. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.dotNotation = NO;
    self.userIsInTheMiddleOfTyping = NO;
    self.firstEntered = NO;
    [self layoutComponents];
}

- (CalculatorBrain*) brain
{
    if(!_brain) _brain = [[CalculatorBrain alloc]init];
    return _brain;
}


- (void) layoutComponents {
    _inputLabel.layer.cornerRadius = 9;
    _inputLabel.layer.masksToBounds = true;
    _resultLabel.layer.cornerRadius = 9;
    _resultLabel.layer.masksToBounds = true;
    _oneButton.layer.cornerRadius = 7;
    _oneButton.layer.masksToBounds = true;
    _twoButton.layer.cornerRadius = 7;
    _twoButton.layer.masksToBounds = true;
    _threeButton.layer.cornerRadius = 7;
    _threeButton.layer.masksToBounds = true;
    _fourButton.layer.cornerRadius = 7;
    _fourButton.layer.masksToBounds = true;
    _fiveButton.layer.cornerRadius = 7;
    _fiveButton.layer.masksToBounds = true;
    _sixButton.layer.cornerRadius = 7;
    _sixButton.layer.masksToBounds = true;
    _sevenButton.layer.cornerRadius = 7;
    _sevenButton.layer.masksToBounds = true;
    _eightButton.layer.cornerRadius = 7;
    _eightButton.layer.masksToBounds = true;
    _nineButton.layer.cornerRadius = 7;
    _nineButton.layer.masksToBounds = true;
    _zeroButton.layer.cornerRadius = 7;
    _zeroButton.layer.masksToBounds = true;
    _dotButton.layer.cornerRadius = 7;
    _dotButton.layer.masksToBounds = true;
    _clearButton.layer.cornerRadius = 7;
    _clearButton.layer.masksToBounds = true;
    _plusButton.layer.cornerRadius = 7;
    _plusButton.layer.masksToBounds = true;
    _subtractButton.layer.cornerRadius = 7;
    _subtractButton.layer.masksToBounds = true;
    _divideButton.layer.cornerRadius = 7;
    _divideButton.layer.masksToBounds = true;
    _multiplyButton.layer.cornerRadius = 7;
    _multiplyButton.layer.masksToBounds = true;
    _enterButton.layer.cornerRadius = 7;
    _enterButton.layer.masksToBounds = true;
    
}

- (IBAction)digitPressed:(UIButton *)sender {
    
    NSString* digit = sender.currentTitle;
    
    if(!(self.dotNotation && [digit isEqualToString:@"."]))
    {
        if([digit isEqualToString:@"."])
            self.dotNotation=YES;
        
        if(self.userIsInTheMiddleOfTyping) //MUST have self
            self.inputLabel.text = [self.inputLabel.text stringByAppendingString:digit];
        else
        {
            self.inputLabel.text=digit;
            self.userIsInTheMiddleOfTyping=YES;
        }
    }
}

- (IBAction)operationPressed:(UIButton *)sender {
    
    
    if([sender.currentTitle isEqualToString:@"C"])
    {
        self.inputLabel.text = @"0";
        self.resultLabel.text=@"0";
        self.brain = nil;
        self.dotNotation = NO;
        self.userIsInTheMiddleOfTyping = NO;
        self.firstEntered = NO;
    }
    else
    {
    
        if(self.userIsInTheMiddleOfTyping) {
            [self enterPressed:nil];
        }
        self.inputLabel.text=[self.inputLabel.text stringByAppendingString:@" "];
        self.resultLabel.text=[self.resultLabel.text stringByAppendingString:sender.currentTitle];
        
        double result = [self.brain performOperation:sender.currentTitle];
        NSString * resultString = [NSString stringWithFormat:@"%g",result];
        self.inputLabel.text = resultString;
    }
}

- (IBAction)enterPressed:(UIButton *)sender {
    
    [self.brain pushOperand:[self.inputLabel.text doubleValue]];
    
    if(self.firstEntered)
    {
        self.resultLabel.text=[self.resultLabel.text stringByAppendingString:@" "];
        self.resultLabel.text=[self.resultLabel.text stringByAppendingString:self.inputLabel.text];
    }
    else
        self.resultLabel.text=self.inputLabel.text;
    
    self.userIsInTheMiddleOfTyping = NO;
    self.dotNotation=NO;
    self.firstEntered=YES;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
