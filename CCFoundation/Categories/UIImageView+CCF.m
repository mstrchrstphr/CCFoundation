//
//  UIImageView+CCF.m
//
//  Created by Christopher Constable on 6/23/12.
//  Copyright (c) 2012 Futura IO All rights reserved.
//

#import "UIImageView+CCF.h"

@implementation UIImageView (CCF)

/** Creates an UIImageView from a UIImage name. */
+ (UIImageView *)imageViewWithImageNamed:(NSString *)imageName
{
	return [[UIImageView alloc] initWithImage:[UIImage imageNamed:imageName]];
}

@end
