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

@end
