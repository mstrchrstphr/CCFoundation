//
//  UIBarButtonItem+CCF.m
//
//  Created by Christopher Constable on 5/26/12.
//  Copyright (c) 2012 Futura IO All rights reserved.
//

#import "UIBarButtonItem+CCF.h"

@implementation UIBarButtonItem (CCF)

+ (UIBarButtonItem *)barButtonItemWithImage:(UIImage *)normalImage
                           highlightedImage:(UIImage *)highlightedImage
                                     target:(id)target
                                   selector:(SEL)selector
{
    // Make the button the same size as the image
	CGRect imageFrame = CGRectZero;
	imageFrame.size = normalImage.size;
	
	UIButton *innerButton = [[UIButton alloc] initWithFrame:imageFrame];	
	[innerButton addTarget:target action:selector forControlEvents:UIControlEventTouchUpInside];
    [innerButton setImage:normalImage forState:UIControlStateNormal];
    [innerButton setImage:highlightedImage forState:UIControlStateHighlighted];
    
	UIBarButtonItem *barButtonItem = [[UIBarButtonItem alloc] initWithCustomView:innerButton];
	barButtonItem.target = target;
	barButtonItem.action = selector;
    
	return barButtonItem;
}

@end
