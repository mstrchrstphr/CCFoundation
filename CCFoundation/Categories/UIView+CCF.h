//
//  UIView+CCF.h
//
//  Created by Christopher Constable on 6/12/12.
//  Copyright (c) 2012 Futura IO All rights reserved.
//

@interface UIView (CCF)

/**
 This simply returns a view's UIViewController.
 Taken from http://stackoverflow.com/a/3732812/55310
 
 Thanks to Brock and Phil
 http://stackoverflow.com/users/311466/brock
 http://stackoverflow.com/users/450263/phil-m
 */
- (UIViewController *)firstAvailableUIViewControllerOfType:(Class)type;

@end
