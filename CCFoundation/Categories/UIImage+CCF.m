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

- (UIImage *)blurredImage
{
    CIContext *context = [CIContext contextWithOptions:nil];
    CIImage *image = [CIImage imageWithCGImage:self.CGImage];
    
    CIFilter *blurFilter = [CIFilter filterWithName:@"CIGaussianBlur"];
    [blurFilter setValue:image forKey:kCIInputImageKey];
    CIImage *blurredImage = [blurFilter valueForKey:kCIOutputImageKey];
    
    CGFloat scale = [[UIScreen mainScreen] scale];
    CGSize scaledSize = CGSizeMake(self.size.width * scale, self.size.height * scale);
    CGImageRef imageRef = [context createCGImage:blurredImage
                                        fromRect:(CGRect){CGPointZero, scaledSize}];
    
    UIImage *resultImage = [UIImage imageWithCGImage:imageRef
                                               scale:1
                                         orientation:UIImageOrientationUp];
    return resultImage;
}

@end
