//
//  UINavigationController+CCF.h
//  Pods
//
//  Created by Christopher Constable on 6/7/13.
//
//

#import <UIKit/UIKit.h>

@interface UINavigationController (CCF)

/** Returns the root view controller of the navigation controller. 
 Returns nil if there is no root. */
- (UIViewController *)rootViewController;

@end
