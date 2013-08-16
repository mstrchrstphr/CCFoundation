//
//  UIImage+CCF.m
//  Pods
//
//  Created by Christopher Constable on 8/14/13.
//
//

#import "UIImage+CCF.h"

@implementation UIImage (CCF)

- (UIImage *)scaleToWidth:(CGFloat)newWidth
{
    float oldWidth = self.size.width;
    float scaleFactor = newWidth / oldWidth;
    
    float newHeight = self.size.height * scaleFactor;
    
    UIGraphicsBeginImageContext(CGSizeMake(newWidth, newHeight));
    [self drawInRect:CGRectMake(0, 0, newWidth, newHeight)];
    UIImage *newImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    return newImage;
}

@end
