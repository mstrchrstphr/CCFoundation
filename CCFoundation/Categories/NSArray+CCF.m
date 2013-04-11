//
//  NSArray+CCF.m
//
//  Created by Christopher Constable on 6/23/12.
//  Copyright (c) 2012 Futura IO All rights reserved.
//

#import "NSArray+CCF.h"

@implementation NSArray (CCF)

/**
 Returns a random object.
 */
- (id)anyObject
{
    return [self objectAtIndex:(arc4random() % self.count)];
}

/**
 Does no throw exceptions for index out of bounds but instead, returns a nil value.
 */
- (id)safeObjectAtIndex:(NSInteger)index
{
    if (index >= [self count]) {
        return nil;
    }
    else {
        return [self objectAtIndex:index];
    }
}

@end
