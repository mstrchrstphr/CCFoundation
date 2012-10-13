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
	
	UIButton *innerButton = [UIButton buttonWithType:UIButtonTypeCustom];
    innerButton.frame = imageFrame;
	[innerButton addTarget:target action:selector forControlEvents:UIControlEventTouchUpInside];
    [innerButton setImage:normalImage forState:UIControlStateNormal];
    [innerButton setImage:highlightedImage forState:UIControlStateHighlighted];
    
	UIBarButtonItem *barButtonItem = [[UIBarButtonItem alloc] initWithCustomView:innerButton];
	barButtonItem.target = target;
	barButtonItem.action = selector;
    
	return barButtonItem;
}

+ (NSArray *)barButtonItemWithUnpaddedImage:(UIImage *)normalImage
                           highlightedImage:(UIImage *)highlightedImage
                                     target:(id)target
                                   selector:(SEL)selector
{
    NSMutableArray *barItems = [NSMutableArray array];
    UIBarButtonItem *negativeSpacer = [[UIBarButtonItem alloc]
                                       initWithBarButtonSystemItem:UIBarButtonSystemItemFixedSpace
                                       target:nil action:nil];
    negativeSpacer.width = -5;
    [barItems addObject:negativeSpacer];
    [barItems addObject:[UIBarButtonItem barButtonItemWithImage:normalImage
                                                   highlightedImage:highlightedImage
                                                             target:target selector:selector]];
    [barItems addObject:negativeSpacer];
    
    return barItems;
}

+ (NSArray *)barButtonItemWithImage:(UIImage *)normalImage
                   highlightedImage:(UIImage *)highlightedImage
                             target:(id)target
                           selector:(SEL)selector
                         andPadding:(NSInteger)spacerWidth
                             onSide:(BarButtonSide)side
{
    NSMutableArray *barItems = [NSMutableArray array];
    UIBarButtonItem *spacer = [[UIBarButtonItem alloc]
                                       initWithBarButtonSystemItem:UIBarButtonSystemItemFixedSpace
                                       target:nil action:nil];
    spacer.width = spacerWidth;
    
    if ((side == BarButtonSideLeft) ||
        (side == BarButtonSideRight)) {
        [barItems addObject:spacer];
    }

    
    [barItems addObject:[UIBarButtonItem barButtonItemWithImage:normalImage
                                               highlightedImage:highlightedImage
                                                         target:target selector:selector]];
    
    if (side == BarButtonSideRight) {
        [barItems addObject:spacer];
    }
    
    return barItems;
}

@end
