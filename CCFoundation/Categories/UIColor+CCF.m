//
//  UIColor+CCF.m
//
//  Created by Christopher Constable on 6/23/12.
//  Copyright (c) 2012 Futura IO All rights reserved.
//

#import "UIColor+CCF.h"

@implementation UIColor (CCF)

+ (UIColor *)colorWithHex:(unsigned int)hexValue
{
	return [UIColor colorWithRed:((float)((hexValue & 0xFF0000) >> 16))  / 255.0
                           green:((float)((hexValue & 0x00FF00) >> 8))   / 255.0
                            blue:((float)(hexValue & 0x0000FF))          / 255.0
                           alpha:1.0];
	
}

+ (UIColor*)randomColor
{
	return [UIColor colorWithRed:((arc4random() % 255) / 255.0)
                           green:((arc4random() % 255) / 255.0)
                            blue:((arc4random() % 255) / 255.0) alpha:1.0];
	
}

+ (UIColor *)randomPastelColor
{
    return [UIColor colorWithRed:(((arc4random() % 130) + 125) / 255.0)
                           green:(((arc4random() % 130) + 125) / 255.0)
                            blue:(((arc4random() % 130) + 125) / 255.0) alpha:1.0];
}

+ (UIColor *)randomBlueColor
{
    return [UIColor colorWithRed:((20 + (arc4random() % 25)) / 255.0)
                           green:((80 + (arc4random() % 50)) / 255.0)
                            blue:((200 + (arc4random() % 55)) / 255.0) alpha:1.0];
}

@end
