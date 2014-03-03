//
//  AVCaptureOutput+CCF.h
//  Pods
//
//  Created by Christopher Constable on 3/3/14.
//
//

#import <AVFoundation/AVFoundation.h>

@interface AVCaptureOutput (CCF)

- (AVCaptureConnection *)findFirstConnectionOfType:(NSString *)captureType;

@end
