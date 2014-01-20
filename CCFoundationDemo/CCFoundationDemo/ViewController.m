//
//  ViewController.m
//  CCFoundationDemo
//
//  Created by Christopher Constable on 1/5/14.
//
//

#import "ViewController.h"
#import "CCFoundation.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.emailValidTextField.text = @"test@test.com";
    self.stringToMD5TextField.text = @"objective-c";
    self.secondsToTimeLabel.text = @"2531";
}

- (IBAction)emailAddressChanged:(id)sender {
    NSString *isValidEmailString = @"NOT VALID";
    BOOL isValidEmail = [self.emailValidTextField.text isValidEmail];
    if (isValidEmail) {
        isValidEmailString = @"VALID";
    }
    
    self.emailValidTextField.text = isValidEmailString;
}

- (IBAction)stringToMD5Changed:(id)sender {
    self.stringToMD5Label.text = [self.stringToMD5TextField.text MD5];
}

- (IBAction)secondsToTimeChanged:(id)sender {
    self.secondsToTimeLabel.text = [NSString stringForTimeInSeconds:[self.secondsToTimeTextField.text intValue]];
}

@end
