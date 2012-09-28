//
//  UIStoryboard+CCF.h
//
//  Created by Christopher Constable on 9/25/12.
//  Copyright (c) 2012 Futura IO. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIStoryboard (CCF)

/**
 This method assumes there are two storyboards: one called "iPhone" and one called
 "iPad". The method detects the current device, loads the appropriate storyboard 
 and instantiates the specified view controller.
 
 @param identifier The identifier of the view controller to instantiate.
 @returns The instantiated view controller.
 */
+ (id)instantiateViewControllerForCurrentDeviceWithIdentifier:(NSString *)identifier;

+ (id)instantiateInitialViewControllerForCurrentDevice;

@end
