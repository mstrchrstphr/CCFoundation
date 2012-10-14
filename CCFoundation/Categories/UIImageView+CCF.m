//
//  UIImageView+CCF.m
//
//  Created by Christopher Constable on 6/23/12.
//  Copyright (c) 2012 Futura IO All rights reserved.
//

#import "UIImageView+CCF.h"
#import <QuartzCore/QuartzCore.h>

@implementation UIImageView (CCF)

/** Creates an UIImageView from a UIImage name. */
+ (UIImageView *)imageViewWithImageNamed:(NSString *)imageName
{
	return [[UIImageView alloc] initWithImage:[UIImage imageNamed:imageName]];
}

- (void)startRotatingWithSpeed:(CGFloat)secondsPerRotation
{
    CABasicAnimation* rotationAnimation;
    rotationAnimation = [CABasicAnimation animationWithKeyPath:@"transform.rotation.z"];
    rotationAnimation.toValue = [NSNumber numberWithFloat: -1 * M_PI * 2.0];
    rotationAnimation.duration = secondsPerRotation;
    rotationAnimation.cumulative = YES;
    rotationAnimation.repeatCount = HUGE_VALF;
    rotationAnimation.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionLinear];
    
    [self.layer addAnimation:rotationAnimation forKey:@"rotationAnimation"];
}

- (void)stopRotating
{
    [self.layer removeAnimationForKey:@"rotationAnimation"];
}
@end
