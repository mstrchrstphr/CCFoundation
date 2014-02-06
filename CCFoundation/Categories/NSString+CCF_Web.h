//
//  NSString+CCF_Web.h
//  CCFoundationDemo
//
//  Created by Christopher Constable on 2/5/14.
//
//

#import <Foundation/Foundation.h>

@interface NSString (CCF_Web)

/**
 *  Correctly URL encodes a string.
 *
 *  @param encoding The current encoding of the string.
 *
 *  @return A URL encoded string.
 */
- (NSString *)urlEncodeUsingEncoding:(NSStringEncoding)encoding;

/**
 *  Returns a dictionary of parameters parsed from the URL of 
 *  the current string. NOTE: only the string should only be 
 *  query/path should and not the full url.
 *
 *  @return Dictionary of URL parameters
 */
- (NSDictionary *)dictionaryFromURLParameters;

/**
 *  Strips the receiving string of any HTML tags.
 *
 *  @return A string with all HTML tags stripped out.
 */
- (NSString *)stringByStrippingHTMLTags;

@end
