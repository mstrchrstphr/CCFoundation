//
//  CCUnitConverter.m
//
//  Created by Christopher Constable on 6/19/13.
//

#import "CCUnitConverter.h"

@implementation CCUnitConverter

+ (double)convertCelsiusToFahrenheit:(double)celsius
{
    return (celsius * 1.8) + 32;
}

+ (double)convertMetersToFeet:(double)meters
{
    return meters * 3.28084;
}

+ (double)convertFahrenheitToCelsius:(double)fahrenheit
{
    return (fahrenheit - 32) / 1.8;
}

+ (double)convertFeetToMeters:(double)feet
{
    return feet / 3.28084;
}

+ (NSString *)convertDegreesToCompassHeading:(NSInteger)degrees
{
    degrees = degrees % 360;
    NSString *headingString = @"";
    
    // Find primary heading
    if ((338 < degrees) || (degrees <= 23)) {
        headingString = @"N";
    }
    else if ((23 < degrees) && (degrees <= 68)) {
        headingString = @"NE";
    }
    else if ((68 < degrees) && (degrees <= 113)) {
        headingString = @"E";
    }
    else if ((113 < degrees) && (degrees <= 158)) {
        headingString = @"SE";
    }
    else if ((158 < degrees) && (degrees <= 203)) {
        headingString = @"S";
    }
    else if ((203 < degrees) && (degrees <= 248)) {
        headingString = @"SW";
    }
    else if ((248 < degrees) && (degrees <= 293)) {
        headingString = @"W";
    }
    else if ((293 < degrees) && (degrees <= 338)) {
        headingString = @"NW";
    }

    return headingString;
}

@end
