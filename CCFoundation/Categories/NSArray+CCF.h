//
//  NSArray+CCF.h
//
//  Created by Christopher Constable on 6/23/12.
//  Copyright (c) 2012 Futura IO All rights reserved.
//

@interface NSArray (CCF)

/**
 Does no throw exceptions for index out of bounds but instead, returns a nil value.
 */
- (id)safeObjectAtIndex:(NSInteger)index;

@end
