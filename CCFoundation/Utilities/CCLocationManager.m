//
//  CCLocationManager.m
//
//  Created by Christopher Constable on 9/14/12.
//  Copyright (c) 2012 Futura IO. All rights reserved.
//

#import "CCLocationManager.h"

@implementation CCLocationManager

+ (CCLocationManager *)sharedLocationManager
{
    static CCLocationManager *locationMgr;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        locationMgr = [[CCLocationManager alloc] init];
    });
    
    return locationMgr;
}

- (void)beginTrackingUserLocation
{
    if ([CLLocationManager locationServicesEnabled] == NO) {
        return;
    }
    
    if (!self.locationManager) {
        self.locationManager = [[CLLocationManager alloc] init];
        
        self.locationManager.delegate = self;
        self.locationManager.desiredAccuracy = kCLLocationAccuracyBest;
        self.locationManager.distanceFilter = kCLLocationAccuracyNearestTenMeters;
    }

    [self.locationManager startMonitoringSignificantLocationChanges];
    
    // Set initial location if available
    CLLocation *currentLocation = self.locationManager.location;
    if (currentLocation) {
        self.currentLocation = currentLocation;
    }
}

- (void)stopTrackingUserLocation
{
    if (self.locationManager) {
        [self.locationManager stopUpdatingLocation];
    }
}

- (void)setCurrentLocation:(CLLocation *)aCurrentLocation
{
    NSDictionary *userInfo = [NSDictionary dictionaryWithObject: aCurrentLocation
                                                         forKey:@"location"];
    [[NSNotificationCenter defaultCenter] postNotificationName: kCCLocationManagerChangeNotification
                                                        object:nil
                                                      userInfo:userInfo];
}

- (void)locationManager:(CLLocationManager *)manager
    didUpdateToLocation:(CLLocation *)newLocation
           fromLocation:(CLLocation *)oldLocation
{
    self.currentLocation = newLocation;
    NSLog(@"CCLocationManager got new location: latitude %+.6f, longitude %+.6f\n",
          newLocation.coordinate.latitude,
          newLocation.coordinate.longitude);
}

@end
