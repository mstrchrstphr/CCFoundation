//
//  UITextField+CCF.m
//
//  Created by Christopher Constable on 5/26/12.
//  Copyright (c) 2012 Futura IO All rights reserved.
//

#import "UITextField+CCF.h"
#import <objc/runtime.h>

static char associationKey;

@implementation UITextField (CCF)

- (UITextField *)nextTextField
{
    return objc_getAssociatedObject(self, &associationKey); 
}

- (void)setNextTextField:(UITextField *)nextTextField
{
    objc_setAssociatedObject(self, &associationKey, nextTextField, OBJC_ASSOCIATION_RETAIN_NONATOMIC); 
}

@end
