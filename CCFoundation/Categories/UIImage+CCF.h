//
//  UIImage+CCF.h
//  Pods
//
//  Created by Christopher Constable on 8/14/13.
//
//

#import <UIKit/UIKit.h>

@interface UIImage (CCF)

+ (UIImage *)imageFromView:(UIView *)view;

- (UIImage *)scaleToWidth:(CGFloat)newWidth;
- (UIImage *)blurredImage;

@end
