//
//  UIColor+CCF.m
//
//  Created by Christopher Constable on 6/23/12.
//  Copyright (c) 2012 Futura IO All rights reserved.
//

@interface UIColor (CCF)

/** UIColor from hex value */
+ (UIColor *)colorWithHex:(unsigned int)hexValue;

/** Random UIColor */
+ (UIColor *)randomColor;

/** Random pastel (lighter) UIColor */
+ (UIColor *)randomPastelColor;

@end
