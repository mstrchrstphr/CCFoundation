//
//  UINavigationController+CCF.m
//  Pods
//
//  Created by Christopher Constable on 6/7/13.
//
//

#import "UINavigationController+CCF.h"

@implementation UINavigationController (CCF)

- (UIViewController *)rootViewController
{
    NSArray *viewControllers = [self viewControllers];
    if (viewControllers.count) {
        return [viewControllers objectAtIndex:0];
    }
    else {
        return nil;
    }
}
@end
