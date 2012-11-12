//
//  CCLocationManager.m
//
//  Created by Christopher Constable on 9/14/12.
//  Copyright (c) 2012 Futura IO. All rights reserved.
//

#import "CCLocationManager.h"

NSString *const CCLMNotificationLocationChanged = @"CCLM:LocationChangedNotification";

@interface CCLocationManager ()
@property (nonatomic, strong) CLLocationManager *locationManager;
@end

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

- (void)startTrackingUserLocation
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
        _currentLocation = currentLocation;
    }
}

- (void)stopTrackingUserLocation
{
    if (self.locationManager) {
        [self.locationManager stopUpdatingLocation];
    }
}

- (void)setCurrentLocation:(CLLocation *)currentLocation
{
    _currentLocation = currentLocation;
    NSDictionary *userInfo = [NSDictionary dictionaryWithObject:_currentLocation
                                                         forKey:@"location"];
    
    [[NSNotificationCenter defaultCenter] postNotificationName:CCLMNotificationLocationChanged
                                                        object:nil
                                                      userInfo:userInfo];
}

- (void)locationManager:(CLLocationManager *)manager
    didUpdateToLocation:(CLLocation *)newLocation
           fromLocation:(CLLocation *)oldLocation
{
    // Throw out old locations
    if ([newLocation.timestamp timeIntervalSinceNow] < -60) return;
    
    if (self.currentLocation) {
        _previousLocation = self.currentLocation;
    }
    self.currentLocation = newLocation;
    NSLog(@"CCLocationManager got new location: latitude %+.6f, longitude %+.6f\n",
          newLocation.coordinate.latitude,
          newLocation.coordinate.longitude);
}

@end
