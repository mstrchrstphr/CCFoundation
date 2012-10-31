//
//  MKMapView+CCF.m
//  Traffic
//
//  Created by Christopher Constable on 10/11/12.
//  Copyright (c) 2012 Futura IO. All rights reserved.
//

#import "MKMapView+CCF.h"

@implementation MKMapView (CCF)

- (void)centerMapOnAnnotations
{
    if ([self.annotations count] == 0) {
        return;
    }
    
    // Set the upper and lower bounds to the first location.
    CLLocationCoordinate2D upperBounds = [(MKPointAnnotation *)[self.annotations objectAtIndex:0] coordinate];
    CLLocationCoordinate2D lowerBounds = [(MKPointAnnotation *)[self.annotations objectAtIndex:0] coordinate];
    
    // Find the "corners" of the box that contains all of our locations by finding the max and min
    // longitude and latitudes.
    for(MKPointAnnotation *curAnnotation in self.annotations) {
        
        // Skip the user
        if (curAnnotation == (MKPointAnnotation *)self.userLocation) {
            continue;
        }
        
        CLLocationCoordinate2D curCoordinates = curAnnotation.coordinate;
        if(curCoordinates.latitude > upperBounds.latitude) {
            upperBounds.latitude = curCoordinates.latitude;
        }
        if(curCoordinates.latitude < lowerBounds.latitude) {
            lowerBounds.latitude = curCoordinates.latitude;
        }
        if(curCoordinates.longitude > upperBounds.longitude) {
            upperBounds.longitude = curCoordinates.longitude;
        }
        if(curCoordinates.longitude < lowerBounds.longitude) {
            lowerBounds.longitude = curCoordinates.longitude;
        }
    }
    
    // Set the region of the map view to contain all of our locations based on the calculations above.
    MKCoordinateSpan locationSpan;
    locationSpan.latitudeDelta = upperBounds.latitude - lowerBounds.latitude;
    locationSpan.longitudeDelta = upperBounds.longitude - lowerBounds.longitude;
    CLLocationCoordinate2D locationCenter;
    locationCenter.latitude = (upperBounds.latitude + lowerBounds.latitude) / 2;
    locationCenter.longitude = (upperBounds.longitude + lowerBounds.longitude) / 2;
    
    [self setRegion:MKCoordinateRegionMake(locationCenter, locationSpan) animated:YES];
}

@end
