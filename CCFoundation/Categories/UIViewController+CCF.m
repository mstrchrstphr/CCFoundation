//
//  UIViewController+CCF.m
//
//  Created by Christopher Constable on 4/8/13.
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
    if ((animation == UIViewControllerTagAnimationsFadeInAscending) ||
        (animation == UIViewControllerTagAnimationsFadeOutAscending)) {
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
            view.hidden = NO;
        }
        
        CGFloat animationDelay = 0.0f;
        CGFloat animationDelayIncrement = 0.1f / taggedViews.count;
        for (int currentIndex = 0; currentIndex < taggedViews.count; currentIndex++) {
            __block UIView *view = [taggedViews objectAtIndex:currentIndex];
            if (currentIndex != (taggedViews.count - 1)) {
                [UIView animateWithDuration:0.2f
                                      delay:animationDelay
                                    options:UIViewAnimationOptionCurveEaseIn
                                 animations:^{
                                     view.alpha = 1.0f;
                                 } completion:nil];
            }
            else {
                [UIView animateWithDuration:0.4f
                                      delay:animationDelay
                                    options:UIViewAnimationOptionCurveEaseIn
                                 animations:^{
                                     view.alpha = 1.0f;
                                 } completion:^(BOOL finished) {
                                     if (completionBlock) {
                                         completionBlock();
                                     }
                                 }];
            }
            
            animationDelay += animationDelayIncrement;
        }
    }
    
    else if (animation == UIViewControllerTagAnimationsFadeOutAscending) {
        for (UIView *view in taggedViews) {
            view.alpha = 1.0f;
            view.hidden = NO;
        }
        
        CGFloat animationDelay = 0.0f;
        CGFloat animationDelayIncrement = 0.1f / taggedViews.count;
        for (int currentIndex = 0; currentIndex < taggedViews.count; currentIndex++) {
            UIView *view = [taggedViews objectAtIndex:currentIndex];
            if (currentIndex != (taggedViews.count - 1)) {
                [UIView animateWithDuration:0.1f
                                      delay:animationDelay
                                    options:UIViewAnimationOptionCurveEaseIn
                                 animations:^{
                                     view.alpha = 0.0f;
                                 } completion:nil];
            }
            else {
                [UIView animateWithDuration:0.4f
                                      delay:animationDelay
                                    options:UIViewAnimationOptionCurveEaseIn
                                 animations:^{
                                     view.alpha = 0.0f;
                                 } completion:^(BOOL finished) {
                                     if (completionBlock) {
                                         completionBlock();
                                     }
                                 }];
            }
            
            animationDelay += animationDelayIncrement;
        }
    }
}

@end
