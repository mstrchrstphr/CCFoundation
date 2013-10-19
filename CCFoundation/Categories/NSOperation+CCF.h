//
//  NSOperation+CCF.h
//  Pods
//
//  Created by Christopher Constable on 10/18/13.
//
//

#import <Foundation/Foundation.h>

@interface NSOperation (CCF)

/**
 *  Adds an array of NSOperations as dependencies.
 *
 *  @param dependecies
 */
- (void)addDependencies:(NSArray *)dependecies;

@end
