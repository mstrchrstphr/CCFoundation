//
//  UIBarButtonItem+CCF.h
//
//  Created by Christopher Constable on 5/26/12.
//  Copyright (c) 2012 Futura IO All rights reserved.
//

@interface UIBarButtonItem (CCF)

/** 
 Creates a bar button item using an image. 
 */
+ (UIBarButtonItem *)barButtonItemWithImage:(UIImage *)normalImage
                           highlightedImage:(UIImage *)highlightedImage
                                     target:(id)target
                                   selector:(SEL)selector;

/**
 Removes the padding that is put by default around UIBarButtonItems.
 */
+ (NSArray *)barButtonItemWithUnpaddedImage:(UIImage *)normalImage
                           highlightedImage:(UIImage *)highlightedImage
                                     target:(id)target
                                   selector:(SEL)selector;

@end
