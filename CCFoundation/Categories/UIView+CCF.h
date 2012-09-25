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

/**
 Displays a "loading" view in the middle of the calling view.
 */
- (void)showLoadingViewWithTitle:(NSString *)title;

/**
 Hides the loading view (if there is one).
 */
- (void)hideLoadingView;

/**
 CGRect methods.
 */
- (void)setFrameX:(CGFloat)xVal;
- (void)setFrameY:(CGFloat)yVal;
- (void)setFrameHeight:(CGFloat)height;
- (void)setFrameWidth:(CGFloat)width;

@end
