//
//  ViewController.h
//  CCFoundationDemo
//
//  Created by Christopher Constable on 1/5/14.
//
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController <UITextFieldDelegate>

@property (weak, nonatomic) IBOutlet UILabel *emailValidLabel;
@property (weak, nonatomic) IBOutlet UITextField *emailValidTextField;
- (IBAction)emailAddressChanged:(id)sender;

@property (weak, nonatomic) IBOutlet UILabel *stringToMD5Label;
@property (weak, nonatomic) IBOutlet UITextField *stringToMD5TextField;
- (IBAction)stringToMD5Changed:(id)sender;

@property (weak, nonatomic) IBOutlet UILabel *secondsToTimeLabel;
@property (weak, nonatomic) IBOutlet UITextField *secondsToTimeTextField;
- (IBAction)secondsToTimeChanged:(id)sender;

@end
