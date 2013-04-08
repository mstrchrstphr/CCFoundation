//
//  UIViewController+CCF.h
//  Pods
//
//  Created by Christopher Constable on 4/8/13.
//
//

#import <UIKit/UIKit.h>

typedef enum {
    UIViewControllerTagAnimationsNone,
    UIViewControllerTagAnimationsFadeInAscending,
    UIViewControllerTagAnimationsFadeOutAsceding,
    UIViewControllerTagAnimationsFadeInAll,
    UIViewControllerTagAnimationsFadeOutAll,
    UIViewControllerTagAnimationsSweepOutLeftAscending
} UIViewControllerTagAnimations;

@interface UIViewController (CCF)

- (void)hideAllTaggedViews;
- (void)animateTaggedViewsWithAnimation:(UIViewControllerTagAnimations)animation
                    withCompletionBlock:(void (^)())completionBlock;

@end
