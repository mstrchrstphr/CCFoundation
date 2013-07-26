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
    [self startTrackingUserLocation:CCLMLocationTrackingModeSignificantChanges];
}

- (void)startTrackingUserLocation:(CCLMLocationTrackingMode)trackingMode
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
    
    if (trackingMode == CCLMLocationTrackingModeSignificantChanges) {
        [self.locationManager startMonitoringSignificantLocationChanges];
    }
    else {
        [self.locationManager startUpdatingLocation];
        [self.locationManager startUpdatingHeading];
    }
    
    // Set initial location if available
    CLLocation *currentLocation = self.locationManager.location;
    if (currentLocation) {
        _currentLocation = currentLocation;
    }
}

- (void)stopTrackingUserLocation
{
    if (self.locationManager) {
        [self.locationManager stopUpdatingHeading];
        [self.locationManager stopUpdatingLocation];
        [self.locationManager stopMonitoringSignificantLocationChanges];
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
     didUpdateLocations:(NSArray *)locations
{
    if (self.currentLocation) {
        _previousLocation = self.currentLocation;
    }
    self.currentLocation = [locations lastObject];
    NSLog(@"CCLocationManager got new location: latitude %+.6f, longitude %+.6f\n",
          self.currentLocation.coordinate.latitude,
          self.currentLocation.coordinate.longitude);
}

@end
