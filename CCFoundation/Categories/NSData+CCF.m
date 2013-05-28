//
//  NSData+CCF.m
//
//  Created by Christopher Constable on 5/24/13.
//  Copyright (c) 2013 Futura IO. All rights reserved.
//

#import "NSData+CCF.h"

@implementation NSData (CCF)

+ (NSData*)dataFromHexString:(NSString *)string
{
    NSMutableData* data = [NSMutableData data];    
    NSArray* words = [string componentsSeparatedByCharactersInSet :[NSCharacterSet whitespaceCharacterSet]];
    NSString* santizedString = [words componentsJoinedByString:@""];
    
    int byteIndex;
    for (byteIndex = 0; byteIndex + 2 <= santizedString.length; byteIndex += 2) {
        NSRange range = NSMakeRange(byteIndex, 2);
        NSString* hexString = [santizedString substringWithRange:range];
        NSScanner* scanner = [NSScanner scannerWithString:hexString];
        unsigned int byteIntValue;
        if ([scanner scanHexInt:&byteIntValue])
            [data appendBytes:&byteIntValue length:1];
    }
    
    return data;
}

@end
