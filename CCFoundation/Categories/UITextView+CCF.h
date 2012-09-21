//
//  UITextView+CCF.h
//
//  Created by Christopher Constable on 9/20/12.
//  Copyright (c) 2012 Futura IO. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UITextView (CCF)

/**
 Expands the UITextView vertically to fit the text.
 
 @param text The text to set the UITextView to.
 @param maxHeight The maximum height to expand to.
 @returns The change in height of the UITextView.
 */
- (CGFloat)setText:(NSString *)text andExpandVerticallyUpTo:(CGFloat)maxHeight;

@end
