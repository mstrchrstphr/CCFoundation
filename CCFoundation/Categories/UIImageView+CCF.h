//
//  UIImageView+CCF.h
//
//  Created by Christopher Constable on 6/23/12.
//  Copyright (c) 2012 Futura IO All rights reserved.
//

@interface UIImageView (CCF)

/** Creates an UIImageView from a UIImage name. */
+ (UIImageView *)imageViewWithImageNamed:(NSString *)imageName;

- (void)setImageWithBounce:(UIImage *)image;
- (void)setImageWithBounce:(UIImage *)image withIntesity:(CGFloat)intesity;

- (void)startRotatingWithSpeed:(CGFloat)secondsPerRotation;
- (void)stopRotating;

@end
