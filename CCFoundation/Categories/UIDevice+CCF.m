//
//  UIDevice+CCF.m
//
//  Created by Christopher Constable on 9/19/12.
//  Copyright (c) 2012 Futura IO. All rights reserved.
//

#import "UIDevice+CCF.h"

@implementation UIDevice (CCF)

+ (BOOL)isIPhone
{
    return (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPhone);
}

+ (BOOL)isIPad
{
    return (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad);
}

@end
