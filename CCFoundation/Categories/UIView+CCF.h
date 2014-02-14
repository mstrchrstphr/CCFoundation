//
//  UIView+CCF.h
//
//  Created by Christopher Constable on 6/12/12.
//  Copyright (c) 2012 Futura IO All rights reserved.
//

@interface UIView (CCF)

/**
 Replacement for the default "tag" property of UIView. Allows for
 an arbitrary object to be set as the tag.
 */
@property (strong, nonatomic) id tagObject;

/**
 Retrieves the first view whose tag object matches the parameter.
 */
- (UIView *)viewWithTagObject:(id)object;

/**
 Returns a view's UIViewController.
 Taken from http://stackoverflow.com/a/3732812/55310
 */
- (UIViewController *)firstAvailableUIViewControllerOfType:(Class)type;

/**
  Removes all subviews.
 */
- (void)removeAllSubviews;

/**
 Adds a tap gesture with a block.
 */
- (UITapGestureRecognizer *)addTapGestureWithBlock:(void(^)(UITapGestureRecognizer *tapGesture))wasTappedBlock;

/**
 Displays a "loading" view in the middle of the calling view.
 */
- (void)showLoadingViewWithTitle:(NSString *)title;

/**
 Hides the loading view (if there is one).
 */
- (void)hideLoadingView;

/**
 Creates a drop shadow around the view.
 TODO: Make drop shadow configurable.
 */
- (void)drawDropShadow;

/** Fade out view. */
- (void)fadeOutWithInterval:(NSTimeInterval)fadeInterval completionBlock:(void(^)(void))completionBlock;

/** Fade in view. */
- (void)fadeInWithInterval:(NSTimeInterval)fadeInterval completionBlock:(void(^)(void))completionBlock;

/**
 CGRect methods.
 */
- (void)setFrameX:(CGFloat)xVal;
- (void)setFrameY:(CGFloat)yVal;
- (void)setFrameHeight:(CGFloat)height;
- (void)setFrameWidth:(CGFloat)width;

/**
 Adding multiple scroll views to the screen will disable the "auto scroll to top"
 feature that many users are used to when tapping the status bar. This method solves
 the issue by setting all scrollsToTop of the view to NO so you can explicitly set
 which view you want to get that behaviour.
 */
- (void)disableScrollsToTopForAllSubviews;

/**
 Dims the lights
 */
- (void)dimTheLights;
- (void)dimTheLightsWithOpacity:(CGFloat)opacity;
- (void)turnTheLightsBackOn;

@end
