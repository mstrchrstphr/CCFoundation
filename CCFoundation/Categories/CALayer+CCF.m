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

- (void)zoomInFromScale:(CGFloat)scale
           withInterval:(CFTimeInterval)interval
{
    CABasicAnimation *animation = [CABasicAnimation animationWithKeyPath:@"transform.scale"];
    animation.fromValue = [NSValue valueWithCATransform3D:CATransform3DMakeScale(scale, scale, 1.0)];
    animation.toValue = [NSValue valueWithCATransform3D:CATransform3DIdentity];
    [animation setDuration:interval];
    animation.fillMode = kCAFillModeForwards;
    animation.removedOnCompletion = NO;
    [self addAnimation:animation forKey:@"zoomIn"];
}

- (void)zoomOutToScale:(CGFloat)scale
          withInterval:(CFTimeInterval)interval
{
    CABasicAnimation *animation = [CABasicAnimation animationWithKeyPath:@"transform.scale"];
    animation.fromValue = [NSValue valueWithCATransform3D:self.transform];
    animation.toValue = [NSValue valueWithCATransform3D:CATransform3DMakeScale(scale, scale, 1.0)];
    [animation setDuration:interval];
    animation.fillMode = kCAFillModeForwards;
    animation.removedOnCompletion = NO;
    [self addAnimation:animation forKey:@"zoomOut"];
}

@end
