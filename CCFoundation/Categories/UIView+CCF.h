//
//  UIView+CCF.h
//
//  Created by Christopher Constable on 6/12/12.
//  Copyright (c) 2012 Futura IO All rights reserved.
//

@interface UIView (CCF)

/**
 Returns a view's UIViewController.
 Taken from http://stackoverflow.com/a/3732812/55310
 */
- (UIViewController *)firstAvailableUIViewControllerOfType:(Class)type;

@end
