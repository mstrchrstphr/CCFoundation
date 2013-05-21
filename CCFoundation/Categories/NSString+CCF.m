//
//  NSString+CCF.m
//
//  Created by Christopher Constable on 5/26/12.
//  Copyright (c) 2012 Futura IO All rights reserved.
//

#import "NSString+CCF.h"

@implementation NSString (CCF)

- (NSString *)incrementIntegerValue
{
    NSInteger integerValue = [self integerValue];
    integerValue++;
    return [NSString stringWithFormat:@"%d", integerValue];
}

- (NSString *)decrementIntegerValue
{
    NSInteger integerValue = [self integerValue];
    integerValue--;
    return [NSString stringWithFormat:@"%d", integerValue];
}

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

- (BOOL)isEmptyOrNil
{
    NSString *trimmed = [self stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
    return (([trimmed isEqualToString:@""]) || (trimmed == nil));
}

- (BOOL)containsString:(NSString *)string
{
    return ([self rangeOfString:string].location != NSNotFound);
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

- (NSDictionary *)dictionaryFromURLParameters
{
    NSArray *pairs = [self componentsSeparatedByString:@"&"];
    NSMutableDictionary *params = [[NSMutableDictionary alloc] init];
    for (NSString *pair in pairs) {
        NSArray *kv = [pair componentsSeparatedByString:@"="];
        NSString *val = [[kv objectAtIndex:1]
                         stringByReplacingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
        [params setObject:val forKey:[kv objectAtIndex:0]];
    }
    
    return params;
}

- (NSString *)humanReadableViewControllerName
{
    NSString *originalNameSanitized = [self stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
    originalNameSanitized = [originalNameSanitized stringByReplacingOccurrencesOfString:@"ViewController" withString:@"Screen"];
    NSString *readableName = [originalNameSanitized substringWithRange:NSMakeRange(0, 1)];
    
    for (int i = 1; i < [originalNameSanitized length]; i++) {
        BOOL isUppercase = [[NSCharacterSet uppercaseLetterCharacterSet] characterIsMember:[originalNameSanitized characterAtIndex:i]];
        if (isUppercase) {
            readableName = [readableName stringByAppendingString:[NSString stringWithFormat:@" %@", [originalNameSanitized substringWithRange:NSMakeRange(i, 1)]]];
        }
        else {
            readableName = [readableName stringByAppendingString:[originalNameSanitized substringWithRange:NSMakeRange(i, 1)]];
        }
    }
    
    return readableName;
}

@end
