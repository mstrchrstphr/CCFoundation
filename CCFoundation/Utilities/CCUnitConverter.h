//
//  CCUnitConverter.h
//
//  Created by Christopher Constable on 6/19/13.
//

#import <Foundation/Foundation.h>

/**
 Unit Conversion. Just the basics.
 */
@interface CCUnitConverter : NSObject

+ (double)convertCelsiusToFahrenheit:(double)celsius;
+ (double)convertMetersToFeet:(double)meters;
+ (double)convertFahrenheitToCelsius:(double)fahrenheit;
+ (double)convertFeetToMeters:(double)feet;

+ (NSString *)convertDegreesToCompassHeading:(NSInteger)degrees;

@end
