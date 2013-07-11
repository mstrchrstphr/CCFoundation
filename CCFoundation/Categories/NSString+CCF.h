//
//  NSString+CCF.h
//
//  Created by Christopher Constable on 5/26/12.
//  Copyright (c) 2012 Futura IO All rights reserved.
//

@interface NSString (CCF)

/**
 Gets the integer value of a string and increments it by 1 and
 then writes it back to the string.
 */
- (NSString *)incrementIntegerValue;

/**
 Gets the integer value of a string and increments it by 1 and
 then writes it back to the string.
 */
- (NSString *)decrementIntegerValue;

/**
 Doesn't crash if the string is nil.
 */
- (NSRange)safeRangeOfString:(NSString *)string;

/**
 Returns the hex value of the string.
 */
- (unsigned int)hexValue;

/**
 Checks if the string to see if it LOOKS like an email. 
 */
- (BOOL)isValidEmail;

- (BOOL)doesContainUppercase;
- (BOOL)doesContainLowercase;
- (BOOL)doesContainNumber;
- (BOOL)isNotEmpty;
- (BOOL)isEmptyOrNil;
- (BOOL)containsString:(NSString *)string;

/**
 Returns a time string in the format of HH:MM:SS given a number of seconds.
 */
+ (NSString *)stringForTimeInSeconds:(int)seconds;

/**
 Given some bytes returns something like 102.95 KB or 5.0 GB. Rounds to two decimal places.
 */
+ (NSString *)stringRepresentationOfNumberOfBytes:(uint64_t)numOfBytes;
- (NSString *)urlEncodeUsingEncoding:(NSStringEncoding)encoding;

/**
 Returns a dictionary of parameters parsed from the URL of the current string.
 NOTE: only the string should only be query/path should and not the full
 url.
 */
- (NSDictionary *)dictionaryFromURLParameters;

/**
 Converts "programmer" view controller names to "non-programmer" name.
 e.g. "HomeViewController" to "Home Screen"
 */
- (NSString *)humanReadableViewControllerName;

@end
