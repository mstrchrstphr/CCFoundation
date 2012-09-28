//
//  UIStoryboard+CCF.m
//
//  Created by Christopher Constable on 9/25/12.
//  Copyright (c) 2012 Futura IO. All rights reserved.
//

#import "UIStoryboard+CCF.h"
#import "UIDevice+CCF.h"

@implementation UIStoryboard (CCF)

+ (id)instantiateViewControllerForCurrentDeviceWithIdentifier:(NSString *)identifier
{
    UIStoryboard *storyboard;
    if ([UIDevice isIPhone]) {
        storyboard = [UIStoryboard storyboardWithName:@"iPhone" bundle:nil];
    }
    else if ([UIDevice isIPad]) {
        storyboard = [UIStoryboard storyboardWithName:@"iPad" bundle:nil];
    }
    
    return [storyboard instantiateViewControllerWithIdentifier:identifier];
}

+ (id)instantiateInitialViewControllerForCurrentDevice
{
    UIStoryboard *storyboard;
    if ([UIDevice isIPhone]) {
        storyboard = [UIStoryboard storyboardWithName:@"iPhone" bundle:nil];
    }
    else if ([UIDevice isIPad]) {
        storyboard = [UIStoryboard storyboardWithName:@"iPad" bundle:nil];
    }
    
    return [storyboard instantiateInitialViewController];
}

@end
