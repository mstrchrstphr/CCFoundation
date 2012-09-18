//
//  UIColor+CCF.m
//
//  Created by Christopher Constable on 6/23/12.
//  Copyright (c) 2012 Futura IO All rights reserved.
//

#import "UIColor+CCF.h"

@implementation UIColor (CCF)

/** UIColor from hex value */
+ (UIColor *)colorWithHex:(unsigned int)hexValue
{
	return [UIColor colorWithRed:((float)((hexValue & 0xFF0000) >> 16))  / 255.0
                           green:((float)((hexValue & 0x00FF00) >> 8))   / 255.0
                            blue:((float)(hexValue & 0x0000FF))          / 255.0
                           alpha:1.0];
	
}

/** Random UIColor */
+ (UIColor*)randomColor
{
	return [UIColor colorWithRed:((arc4random() % 255) / 255.0)
                           green:((arc4random() % 255) / 255.0)
                            blue:((arc4random() % 255) / 255.0) alpha:1.0];
	
}

/** Random pastel (lighter) UIColor */
+ (UIColor *)randomPastelColor
{
    return [UIColor colorWithRed:(((arc4random() % 130) + 125) / 255.0)
                           green:(((arc4random() % 130) + 125) / 255.0)
                            blue:(((arc4random() % 130) + 125) / 255.0) alpha:1.0];
}

@end
