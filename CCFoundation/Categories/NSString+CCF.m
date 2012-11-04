//
//  NSString+CCF.m
//
//  Created by Christopher Constable on 5/26/12.
//  Copyright (c) 2012 Futura IO All rights reserved.
//

#import "NSString+CCF.h"

@implementation NSString (CCF)

- (BOOL)isValidEmail
{
    NSString *emailRegex = @"[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,4}";
    NSPredicate *emailPredicate = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", emailRegex];
    return [emailPredicate evaluateWithObject:self];
}

- (BOOL)doesContainUppercase
{
    NSCharacterSet *set = [NSCharacterSet characterSetWithCharactersInString:@"ABCDEFGHIJKLKMNOPQRSTUVWXYZ"];
    
    if ([self rangeOfCharacterFromSet:set].location == NSNotFound) {
        return NO;
    }
    
    return YES;
}

- (BOOL)doesContainLowercase
{
    NSCharacterSet *set = [NSCharacterSet characterSetWithCharactersInString:@"abcdefghijklmnopqrstuvwxyz"];
    
    if ([self rangeOfCharacterFromSet:set].location == NSNotFound) {
        return NO;
    }
    
    return YES;
}

- (BOOL)doesContainNumber
{
    NSCharacterSet *set = [NSCharacterSet characterSetWithCharactersInString:@"0123456789"];
    
    if ([self rangeOfCharacterFromSet:set].location == NSNotFound) {
        return NO;
    }
    
    return YES;
}

- (BOOL)isNotEmpty
{
    NSString *trimmed = [self stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
    return ![trimmed isEqualToString:@""];
}

+ (NSString *)stringForTimeInSeconds:(int)seconds
{
    int totalHours, totalMinutes, displayedMinutes, displayedSeconds;
    displayedSeconds = seconds % 60;
    totalMinutes = floor(seconds / 60);
    displayedMinutes = totalMinutes % 60;
    totalHours = floor(totalMinutes / 60);
    
    NSString *returnString = [NSString stringWithFormat:@"%0.2d:%0.2d", displayedMinutes, displayedSeconds];
    return returnString;
}

+ (NSString *)stringRepresentationOfNumberOfBytes:(uint64_t)numOfBytes
{
    CGFloat rawValue = (CGFloat)numOfBytes / 1024.0f;
    int multiplyFactor = 0;
    
    NSArray *suffixTokens = [NSArray arrayWithObjects:@"KB",@"MB",@"GB",@"TB", nil];
    while (rawValue > 1024) {
        rawValue /= 1024;
        multiplyFactor++;
    }
    
    return [NSString stringWithFormat:@"%4.1f %@", rawValue, [suffixTokens objectAtIndex:multiplyFactor]];
}

- (NSString *)urlEncodeUsingEncoding:(NSStringEncoding)encoding
{
	return (__bridge NSString *)CFURLCreateStringByAddingPercentEscapes(NULL,
                                                               (CFStringRef)self,
                                                               NULL,
                                                               (CFStringRef)@"!*'\"();:@&=+$,/?%#[]% ",
                                                               CFStringConvertNSStringEncodingToEncoding(encoding));
}

@end
