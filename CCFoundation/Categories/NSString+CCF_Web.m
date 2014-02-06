//
//  NSString+CCF_Web.m
//  CCFoundationDemo
//
//  Created by Christopher Constable on 2/5/14.
//
//

#import "NSString+CCF_Web.h"

@implementation NSString (CCF_Web)

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

- (NSString *)stringByStrippingHTMLTags
{
    NSData *stringData = [self dataUsingEncoding:NSUTF8StringEncoding];
    NSDictionary *attributes = @{NSDocumentTypeDocumentAttribute: NSHTMLTextDocumentType,
                                 NSCharacterEncodingDocumentAttribute: @(NSUTF8StringEncoding)};
    NSAttributedString *attributedString = [[NSAttributedString alloc] initWithData:stringData
                                                                            options:attributes
                                                                 documentAttributes:nil
                                                                              error:nil];
    
    return [attributedString string];
}

@end
