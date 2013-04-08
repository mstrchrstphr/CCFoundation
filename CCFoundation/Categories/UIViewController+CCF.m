//
//  UIViewController+CCF.m
//  Pods
//
//  Created by Christopher Constable on 4/8/13.
//
//

#import "UIViewController+CCF.h"

@implementation UIViewController (CCF)

- (void)hideAllTaggedViews
{
    for (UIView *view in [self.view subviews]) {
        if (view.tag > 0) {
            view.hidden = YES;
        }
    }
}

- (void)animateTaggedViewsWithAnimation:(UIViewControllerTagAnimations)animation
                    withCompletionBlock:(void (^)())completionBlock
{
    NSMutableArray *taggedViews = [NSMutableArray array];
    for (UIView *view in [self.view subviews]) {
        if (view.tag > 0) {
            [taggedViews addObject:view];
        }
    }
    
    // Sort appropriately
    if (animation == UIViewControllerTagAnimationsFadeInAscending) {
        NSSortDescriptor *sortDescriptor = [[NSSortDescriptor alloc] initWithKey:@"tag" ascending:YES];
        taggedViews = [[taggedViews sortedArrayUsingDescriptors:@[sortDescriptor]] mutableCopy];
    }
    else {
        NSSortDescriptor *sortDescriptor = [[NSSortDescriptor alloc] initWithKey:@"tag" ascending:NO];
        taggedViews = [[taggedViews sortedArrayUsingDescriptors:@[sortDescriptor]] mutableCopy];
    }
    
    if (animation == UIViewControllerTagAnimationsFadeInAscending) {
        for (UIView *view in taggedViews) {
            view.alpha = 0.0f;
        }
        
        CGFloat animationDelay = 0.0f;
        for (UIView *view in taggedViews) {
            [UIView animateWithDuration:0.5f
                                  delay:animationDelay
                                options:UIViewAnimationOptionCurveEaseIn
                             animations:^{
                                 view.alpha = 1.0f;
                             } completion:^(BOOL finished) {
                                 
                             }];
            animationDelay += 0.3f;
        }
    }
    
    else if (animation == UIViewControllerTagAnimationsFadeOutAsceding) {
        for (UIView *view in taggedViews) {
            view.alpha = 1.0f;
        }
        
        CGFloat animationDelay = 0.0f;
        for (UIView *view in taggedViews) {
            [UIView animateWithDuration:0.5f
                                  delay:animationDelay
                                options:UIViewAnimationOptionCurveEaseIn
                             animations:^{
                                 view.alpha = 0.0f;
                             } completion:^(BOOL finished) {
                                 
                             }];
            animationDelay += 0.3f;
        }
    }
}

@end
