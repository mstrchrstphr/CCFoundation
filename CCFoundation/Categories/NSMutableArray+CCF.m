//
//  NSMutableArray+CCF.m
//  Kindrid
//
//  Created by Christopher Constable on 10/13/12.
//  Copyright (c) 2012 Futura IO. All rights reserved.
//

#import "NSMutableArray+CCF.h"

@implementation NSMutableArray (CCF)

- (void)shuffle
{
    NSUInteger count = [self count];
    for (NSUInteger i = 0; i < count; ++i) {
        NSInteger nElements = count - i;
        NSInteger n = (arc4random() % nElements) + i;
        [self exchangeObjectAtIndex:i withObjectAtIndex:n];
    }
}

@end
