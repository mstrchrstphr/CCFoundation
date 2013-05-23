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

- (void)setImageWithBounce:(UIImage *)image
{
    [self setImageWithBounce:image withIntesity:1.4];
}

- (void)setImageWithBounce:(UIImage *)image withIntesity:(CGFloat)intesity
{
    self.image = image;
    
    CGRect originalFrame = self.frame;
    [UIView animateWithDuration:0.08
                          delay:0.0
                        options:UIViewAnimationOptionCurveEaseIn | UIViewAnimationOptionBeginFromCurrentState
                     animations:^{
                         CGRect newFrame = self.frame;
                         newFrame.origin.x -= ((newFrame.size.width * intesity) - newFrame.size.width) / 2;
                         newFrame.origin.y -= ((newFrame.size.height * intesity) - newFrame.size.height) / 2;
                         newFrame.size.width = newFrame.size.width * intesity;
                         newFrame.size.height = newFrame.size.height * intesity;
                         self.frame = newFrame;
                     }
                     completion:^(BOOL finished) {
                         [UIView animateWithDuration:0.08
                                               delay:0.0
                                             options:UIViewAnimationOptionCurveEaseIn | UIViewAnimationOptionBeginFromCurrentState
                                          animations:^{
                                              self.frame = originalFrame;
                                          }
                                          completion:nil];
                     }];
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
