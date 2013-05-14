//
//  UIView+CCF.m
//
//  Created by Christopher Constable on 6/12/12.
//  Copyright (c) 2012 Futura IO All rights reserved.
//

#import "UIView+CCF.h"
#import <QuartzCore/QuartzCore.h>
#import <objc/runtime.h>

static char tagObjectAssociationKey;
static char loadingViewAssociationKey;

@implementation UIView (CCF)

@dynamic tagObject;

- (id)tagObject {
    return objc_getAssociatedObject(self, &tagObjectAssociationKey);
}

- (void)setTagObject:(id)tagObject {
    objc_setAssociatedObject(self, &tagObjectAssociationKey, tagObject, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}


- (UIView *)viewWithTagObject:(id)object
{
    if (!object) {
        return nil;
    }
    
    for (UIView *subview in self.subviews) {
        UIView *resultView = [subview viewWithTagObject:object];
        if (resultView) {
            return resultView;
        }
    }
    return nil;
}

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

/**
 Displays a "loading view" in the middle of the calling view.
 */
- (void)showLoadingViewWithTitle:(NSString *)title
{
    UIView *loadingView = [[UIView alloc] initWithFrame:self.frame];
    loadingView.center = self.center;
    loadingView.autoresizingMask = UIViewAutoresizingFlexibleHeight | UIViewAutoresizingFlexibleWidth;
    [loadingView setUserInteractionEnabled:NO];
    
    UIView *popupBackground = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 151, 85)];
    popupBackground.center = loadingView.center;
    popupBackground.autoresizingMask = UIViewAutoresizingFlexibleLeftMargin | UIViewAutoresizingFlexibleRightMargin |
                                        UIViewAutoresizingFlexibleTopMargin | UIViewAutoresizingFlexibleBottomMargin;
    [popupBackground setBackgroundColor:[UIColor blackColor]];
    [popupBackground setAlpha:0.7];
    [popupBackground.layer setCornerRadius:12.0];
        
    UILabel *loadingLabel = [[UILabel alloc] initWithFrame:CGRectMake(53, 14, 80, 58)];
    [loadingLabel setNumberOfLines:0];
    [loadingLabel setTextColor:[UIColor whiteColor]];
    [loadingLabel setBackgroundColor:[UIColor clearColor]];
    [loadingLabel setFont:[UIFont fontWithName:@"Helvetica" size:16]];
    [loadingLabel setText:title];
    
    UIActivityIndicatorView *activityIndicator = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleWhite];
    activityIndicator.frame = CGRectMake(20, 33, activityIndicator.frame.size.width, activityIndicator.frame.size.height);
    [activityIndicator startAnimating];
    
    [popupBackground addSubview:loadingLabel];
    [popupBackground addSubview:activityIndicator];
    [loadingView addSubview:popupBackground];
    
    // Save the loading view so we can remove it later.
    objc_setAssociatedObject(self, &loadingViewAssociationKey, loadingView, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    
    // Fade in
    dispatch_async(dispatch_get_main_queue(), ^{
        loadingView.alpha = 0.0;
        [self addSubview:loadingView];
        [UIView animateWithDuration:0.35
                              delay:0.0
                            options:UIViewAnimationCurveEaseIn
                         animations:^{
                             loadingView.alpha = 1.0;
                         }
                         completion:NULL
         ];
    });
}

/**
 Hides the "loading view" (if there is one).
 */
- (void)hideLoadingView
{
    UIView *loadingView = (UIView *)objc_getAssociatedObject(self, &loadingViewAssociationKey);
    
    // Fade out
    if (loadingView) {
        dispatch_async(dispatch_get_main_queue(), ^{
            [UIView animateWithDuration:0.35
                                  delay:0.0
                                options:UIViewAnimationCurveEaseIn
                             animations:^{
                                 loadingView.alpha = 0.0;
                             }
                             completion:^(BOOL finished) {
                                 [loadingView removeFromSuperview];
                             }
             ];
        });
    }
}

- (void)drawDropShadow
{
    UIBezierPath *path  = [UIBezierPath bezierPathWithRect:self.bounds];
    self.layer.shadowPath = [path CGPath];
    
    self.layer.shadowColor    = [[UIColor lightGrayColor] CGColor];
    self.layer.shadowOffset   = CGSizeMake(1, 1);
    self.layer.shadowOpacity  = 1.0;
    self.layer.shadowRadius   = 3.0;
}

- (void)fadeOutWithInterval:(CGFloat)fadeInterval andCompletionBlock:(void(^)())completionBlock
{
    [UIView animateWithDuration:0.3
                          delay:0.0
                        options:UIViewAnimationOptionCurveLinear
                     animations:^{
                         self.alpha = 0.0;
                     }
                     completion:^(BOOL finished) {
                         self.hidden = YES;
                         if (completionBlock) {
                             completionBlock();
                         }
                     }];
}

- (void)fadeInWithInterval:(CGFloat)fadeInterval andCompletionBlock:(void(^)())completionBlock
{
    self.alpha = 0.0;
    self.hidden = NO;
    [UIView animateWithDuration:0.3
                          delay:0.0
                        options:UIViewAnimationOptionCurveLinear
                     animations:^{
                         self.alpha = 1.0;
                     }
                     completion:^(BOOL finished) {
                         if (completionBlock) {
                             completionBlock();
                         }
                     }];
}

- (void)setFrameX:(CGFloat)xVal
{
    CGRect currentFrame = self.frame;
    currentFrame.origin.x = xVal;
    self.frame = currentFrame;
}

- (void)setFrameY:(CGFloat)yVal
{
    CGRect currentFrame = self.frame;
    currentFrame.origin.x = yVal;
    self.frame = currentFrame;
}

- (void)setFrameHeight:(CGFloat)height
{
    CGRect currentFrame = self.frame;
    currentFrame.size.height = height;
    self.frame = currentFrame;
}

- (void)setFrameWidth:(CGFloat)width
{
    CGRect currentFrame = self.frame;
    currentFrame.size.width = width;
    self.frame = currentFrame;
}

- (void)disableScrollsToTopForAllSubviews
{
    [self disableScrollsToTopForAllSubviewsInView:self];
}

- (void)disableScrollsToTopForAllSubviewsInView:(UIView *)view
{
    for (UIView *subview in view.subviews) {
        if ([subview isKindOfClass:[UIScrollView class]]) {
            ((UIScrollView *)subview).scrollsToTop = NO;
        }
        [self disableScrollsToTopForAllSubviewsInView:subview];
    }
}

- (void)dimTheLights
{
    [self dimTheLightsWithOpacity:0.4];
}

- (void)dimTheLightsWithOpacity:(CGFloat)opacity
{
    __block UIView *dimmer = [[UIView alloc] initWithFrame:self.bounds];
    dimmer.userInteractionEnabled = NO;
    dimmer.tag = 80139587498; // random tag
    dimmer.backgroundColor = [UIColor blackColor];
    dimmer.alpha = 0.0;
    [self addSubview:dimmer];
    [self bringSubviewToFront:dimmer];
    
    [UIView animateWithDuration:0.3
                          delay:0.0
                        options:0
                     animations:^{
                         dimmer.alpha = opacity;
                     } completion:nil];
}

- (void)turnTheLightsBackOn
{
    __block UIView *dimmer = [self viewWithTag:80139587498];
    if (dimmer) {
        [UIView animateWithDuration:0.3
                              delay:0.0
                            options:0
                         animations:^{
                             dimmer.alpha = 0.0;
                         } completion:^(BOOL finished) {
                             [dimmer removeFromSuperview];
                         }];
    }
}

@end
