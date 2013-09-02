//
//  NSDictionary+CCF.m
//
//  Created by Christopher Constable on 6/5/12.
//  Copyright (c) 2012 Futura IO All rights reserved.
//

#import "NSDictionary+CCF.h"

@implementation NSDictionary (CCF)

- (id)safeValueForKey:(NSString *)key
{
    if (key == nil) {
        return nil;
    }
    else {
        return [self objectForKey:key];
    }
}

- (NSString *)safeStringForKey:(NSString *)key
{
    NSString *string = [self safeValueForKey:key];
    if ((string == nil) || [string isKindOfClass:[NSNull class]]) {
        return @"";
    }
    else if ([string isKindOfClass:[NSNumber class]]) {
        return [(NSNumber *)string stringValue];
    }
    else {
        return string;
    }
}
@end
