//
//  CALayer+CCF.m
//
//  Created by Christopher Constable on 2/13/14.
//
//

#import "CALayer+CCF.h"

@implementation CALayer (CCF)

- (void)fadeOutWithInterval:(CFTimeInterval)interval
                 completion:(void (^)(void))completion
{
    [CATransaction begin];
    [CATransaction setAnimationDuration:interval];
    [CATransaction setAnimationTimingFunction:[CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut]];
    self.opacity = 0.0;
    if (completion) {
        [CATransaction setCompletionBlock:completion];
    }
    [CATransaction commit];
}

- (void)fadeInWithInterval:(CFTimeInterval)interval
                completion:(void (^)(void))completion
{
    [CATransaction begin];
    [CATransaction setAnimationDuration:interval];
    [CATransaction setAnimationTimingFunction:[CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut]];
    self.opacity = 1.0;
    if (completion) {
        [CATransaction setCompletionBlock:completion];
    }
    [CATransaction commit];
}

@end
