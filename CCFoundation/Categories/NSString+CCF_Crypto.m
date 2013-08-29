//
//  NSString+CCF_Crypto.m
//  Pods
//
//  Created by Christopher Constable on 8/28/13.
//
//

#import "NSString+CCF_Crypto.h"
#import <CommonCrypto/CommonDigest.h>

@implementation NSString (CCF_Crypto)

- (NSString *)MD5
{
    const char *stringPointer = [self UTF8String];
    unsigned char md5Buffer[CC_MD5_DIGEST_LENGTH];
    
    // Create 16 byte MD5 hash value, store in buffer
    CC_MD5(stringPointer, strlen(stringPointer), md5Buffer);
    
    // Convert MD5 value in the buffer to NSString of hex values
    NSMutableString *output = [NSMutableString stringWithCapacity:CC_MD5_DIGEST_LENGTH * 2];
    for(int i = 0; i < CC_MD5_DIGEST_LENGTH; i++) {
        [output appendFormat:@"%02x",md5Buffer[i]];
    }
    
    return output;
}

@end
