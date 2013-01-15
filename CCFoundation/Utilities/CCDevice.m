//
//  CCDevice.m
//  Traffic
//
//  Created by Christopher Constable on 1/14/13.
//  Copyright (c) 2013 Futura IO. All rights reserved.
//

#import "CCDevice.h"

@implementation CCDevice

+ (NSString *)deviceTypeString
{
    NSString *deviceType = @"Unknown Device";
    
    if (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPhone)
    {
        deviceType = @"iPhone";
    }
    else if (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad)
    {
        deviceType = @"iPad";
    }
    
    return deviceType;
}

@end
