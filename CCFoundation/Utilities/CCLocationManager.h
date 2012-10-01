//
//  CCLocationManager.h
//
//  Created by Christopher Constable on 9/14/12.
//  Copyright (c) 2012 Futura IO. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <MapKit/MapKit.h>
#import <CoreLocation/CoreLocation.h>

static NSString* const kCCLocationManagerChangeNotification= @"kCCLocationManagerChangeNotification";

@interface CCLocationManager : NSObject <CLLocationManagerDelegate>

@property (nonatomic, strong) CLLocationManager *locationManager;

+ (CCLocationManager *)sharedLocationManager;

- (void)beginTrackingUserLocation;
- (void)stopTrackingUserLocation;
- (void)setCurrentLocation:(CLLocation *)aCurrentLocation;

@end
