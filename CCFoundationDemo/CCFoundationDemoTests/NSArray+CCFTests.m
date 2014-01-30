//
//  NSArray+CCFTests.m
//  CCFoundationDemo
//
//  Created by Christopher Constable on 1/29/14.
//
//

#import <XCTest/XCTest.h>
#import "NSArray+CCF.h"

@interface NSArray_CCFTests : XCTestCase
@property (nonatomic, strong) NSArray *array;
@end

@implementation NSArray_CCFTests

- (void)setUp
{
    [super setUp];
    self.array = @[@1, @2, @3, @4, @5];
}

- (void)tearDown
{
    [super tearDown];
}

- (void)testAnyObjectReturnsAnObjectInTheArray
{
    id object = [self.array anyObject];
    XCTAssert([self.array containsObject:object], @"Calling anyObject should return an object from the array.");
}

- (void)testSafeObjectForIndexDoesNotThrowException
{
    XCTAssertNoThrow([self.array safeObjectAtIndex:INT32_MAX], @"Calling safeObject should not throw an exception if the index is out of bounds.");
}

- (void)testSafeObjectForIndexWithAnOutOfBoundsIndexReturnsNil
{
    XCTAssertNil([self.array safeObjectAtIndex:INT32_MAX], @"Calling safeObject with an out of bounds index should return nil.");
}

@end
