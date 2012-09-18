//
//  UITextField+CCF.h
//
//  Created by Christopher Constable on 5/26/12.
//  Copyright (c) 2012 Futura IO All rights reserved.
//

/**
 Adds a property called "nextTextField" to the UITextField class.
 This property can be assigned in IB in a very natural way.
 
 To make this work the following code can be added to the VC:
 
 - (BOOL)textFieldShouldReturn:(UITextField *)textField
 {
    UITextField *next = [textField nextTextField];
    if (next) {
        [next becomeFirstResponder];
    }
    else {
        [self loginButtonPressed:nil];
    }

    return NO;
 }
 
 The class using this extension should make use of the "nextTextField"
 property in the - (BOOL)textFieldShouldReturn:(UITextField *)theTextField
 method of the UITextFieldDelegate.
 
 More information on objc_getAssociatedObject here:
 https://developer.apple.com/library/ios/#documentation/Cocoa/Conceptual/ObjectiveC/Chapters/ocAssociativeReferences.html#//apple_ref/doc/uid/TP30001163-CH24-SW1
 */

@interface UITextField (CCF)

@property(strong, nonatomic) IBOutlet UITextField *nextTextField;

@end
