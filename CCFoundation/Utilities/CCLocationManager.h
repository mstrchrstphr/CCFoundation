//
//  CCLocationManager.h
//
//  Created by Christopher Constable on 9/14/12.
//  Copyright (c) 2012 Futura IO. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <MapKit/MapKit.h>
#import <CoreLocation/CoreLocation.h>

extern NSString *const CCLMNotificationLocationChanged;

@interface CCLocationManager : NSObject <CLLocationManagerDelegate>

@property (nonatomic, readonly) CLLocation *currentLocation;
@property (nonatomic, readonly) CLLocation *previousLocation;

+ (CCLocationManager *)sharedLocationManager;

- (void)startTrackingUserLocation;
- (void)stopTrackingUserLocation;

@end
