//
//  NSDictionary+CFF.h
//
//  Created by Christopher Constable on 6/5/12.
//  Copyright (c) 2012 Futura IO All rights reserved.
//

@interface NSDictionary (CCF)

/** If either the key or the value is invalid or nil, nil will be returned. */
- (id)safeValueForKey:(NSString *)key;
- (id)safeStringForKey:(NSString *)key;

@end
