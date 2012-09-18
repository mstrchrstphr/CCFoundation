//
//  UIView+CCF.m
//
//  Created by Christopher Constable on 6/12/12.
//  Copyright (c) 2012 Futura IO All rights reserved.
//

#import "UIView+CCF.h"

@implementation UIView (CCF)

- (id)traverseResponderChainForUIViewControllerOfType:(Class)type {
    id nextResponder = [self nextResponder];
    if ([nextResponder isKindOfClass:[type class]]) {
        return nextResponder;
    } else if ([nextResponder isKindOfClass:[UIView class]]) {
        return [nextResponder traverseResponderChainForUIViewControllerOfType:type];
    } else {
        return nil;
    }
}

- (UIViewController *)firstAvailableUIViewControllerOfType:(Class)type {
    return (UIViewController *)[self traverseResponderChainForUIViewControllerOfType:type];
}

@end
