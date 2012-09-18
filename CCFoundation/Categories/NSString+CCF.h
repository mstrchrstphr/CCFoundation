//
//  NSString+CCF.h
//
//  Created by Christopher Constable on 5/26/12.
//  Copyright (c) 2012 Futura IO All rights reserved.
//

@interface NSString (CCF)

- (BOOL)isValidateEmail;
- (BOOL)doesContainUppercase;
- (BOOL)doesContainLowercase;
- (BOOL)doesContainNumber;

/**
 Returns a time string in the format of HH:MM:SS given a number of seconds.
 */
+ (NSString *)stringForTimeInSeconds:(int)seconds;

/**
 Given some bytes returns something like 102.95 KB or 5.0 GB. Rounds to two decimal places.
 */
+ (NSString *)stringRepresentationOfNumberOfBytes:(uint64_t)numOfBytes;

@end
