//
//  UILabel+CCF.h
//
//  Created by Christopher Constable on 9/20/12.
//  Copyright (c) 2012 Futura IO. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UILabel (CCF)

/**
 Expands the label vertically to fit the text.
 
 @param text The text to set the UILabel to.
 @param maxHeight The maximum height to expand to.
 @returns The change in height of the UILabel.
 */
- (CGFloat)setText:(NSString *)text andExpandVerticallyUpTo:(CGFloat)maxHeight;

@end
