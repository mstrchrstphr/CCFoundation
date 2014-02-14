//
//  CALayer+CCF.h
//
//  Created by Christopher Constable on 2/13/14.
//
//

#import <QuartzCore/QuartzCore.h>

@interface CALayer (CCF)

- (void)fadeOutWithInterval:(CFTimeInterval)interval completion:(void (^)(void))completion;
- (void)fadeInWithInterval:(CFTimeInterval)interval completion:(void (^)(void))completion;

- (void)zoomInFromScale:(CGFloat)scale withInterval:(CFTimeInterval)interval;
- (void)zoomOutToScale:(CGFloat)scale withInterval:(CFTimeInterval)interval;

@end
