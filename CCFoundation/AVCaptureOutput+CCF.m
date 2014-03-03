//
//  AVCaptureOutput+CCF.m
//  Pods
//
//  Created by Christopher Constable on 3/3/14.
//
//

#import "AVCaptureOutput+CCF.h"

@implementation AVCaptureOutput (CCF)

- (AVCaptureConnection *)findFirstConnectionOfType:(NSString *)captureType
{
    __block AVCaptureConnection *returnConnection = nil;
    [self.connections enumerateObjectsUsingBlock:^(AVCaptureConnection *connection, NSUInteger idx, BOOL *stop) {
        [connection.inputPorts enumerateObjectsUsingBlock:^(AVCaptureInputPort *port, NSUInteger idx, BOOL *stop) {
            if ([port.mediaType isEqualToString:captureType]) {
				returnConnection = connection;
				*stop = YES;
			}
        }];
        
        if (returnConnection) {
            *stop = YES;
        }
    }];
    
    return returnConnection;
}

@end
