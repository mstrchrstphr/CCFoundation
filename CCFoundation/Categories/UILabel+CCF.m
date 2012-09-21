//
//  UILabel+CCF.m
//
//  Created by Christopher Constable on 9/20/12.
//  Copyright (c) 2012 Futura IO. All rights reserved.
//

#import "UILabel+CCF.h"

@implementation UILabel (CCF)

- (CGFloat)setText:(NSString *)text andExpandVerticallyUpTo:(CGFloat)maxHeight
{
    CGFloat oldLabelHeight = self.frame.size.height;
    CGSize maxLabelSize = CGSizeMake(self.frame.size.width, 9999.0);
    
    CGSize adjustedLabelSize = [text sizeWithFont:self.font constrainedToSize:maxLabelSize lineBreakMode:self.lineBreakMode];
    CGRect newLabelFrame = CGRectMake(self.frame.origin.x, self.frame.origin.y, adjustedLabelSize.width, maxHeight);
    self.frame = newLabelFrame;
    self.numberOfLines = 0;
    [self setText:text];
    
    if (adjustedLabelSize.height < maxHeight) {
        [self sizeToFit];
    }
    
    return (self.frame.size.height - oldLabelHeight);
}

@end
