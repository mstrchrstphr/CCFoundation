//
//  NSString+CCFTests.m
//  CCFoundationDemo
//
//  Created by Christopher Constable on 2/5/14.
//
//

#import <XCTest/XCTest.h>

#import "NSString+CCF.h"
#import "NSString+CCF_Web.h"
#import "NSString+CCF_Crypto.h"

@interface NSString_CCFTests : XCTestCase

@end

@implementation NSString_CCFTests

- (void)setUp
{
    [super setUp];
    // Put setup code here; it will be run once, before the first test case.
}

- (void)tearDown
{
    // Put teardown code here; it will be run once, after the last test case.
    [super tearDown];
}

- (void)testStrippingHTMLFromStringReturnsValidString
{
    NSString *htmlSnippet = @"<html><body><p>hello there</p> <p>goodbye now!</p></body></html>";
    NSString *plainString = [htmlSnippet stringByStrippingHTMLTags];
    
    XCTAssertNotNil(plainString, @"Stripping HTML from a string should not remove textual content.");
    XCTAssert(plainString.length > 0, @"Stripping HTML from a string should not remove textual content.");
}

- (void)testCanStripHTMLFromString
{
    NSString *htmlSnippet = @"<html><body><p>hello there</p> <p>goodbye now!</p></body></html>";
    NSString *plainString = [htmlSnippet stringByStrippingHTMLTags];
    
    XCTAssertFalse([plainString containsString:@"html"], @"The string should not contain any HTML tags");
    XCTAssertFalse([plainString containsString:@"body"], @"The string should not contain any HTML tags");
    XCTAssertFalse([plainString containsString:@"<p>"], @"The string should not contain any HTML tags");
}

@end
