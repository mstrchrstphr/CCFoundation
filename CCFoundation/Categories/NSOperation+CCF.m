//
//  NSOperation+CCF.m
//  Pods
//
//  Created by Christopher Constable on 10/18/13.
//
//

#import "NSOperation+CCF.h"

@implementation NSOperation (CCF)

- (void)addDependencies:(NSArray *)dependecies
{
    [dependecies enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop) {
        if ([obj isKindOfClass:[NSOperation class]]) {
            [self addDependency:obj];
        }
        else {
            [NSException raise:@"NSOperation dependencies are expected to be of class NSOperation."
                        format:@"Unexcpected class %@.", [obj class]];
        }
    }];
}

@end
