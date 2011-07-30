//
//  Theater.m
//  TheaterLocation
//
//  Created by epinom on 28/07/11.
//  Copyright 2011 epinom. All rights reserved.
//

#import "Theater.h"


@implementation Theater

@synthesize id;
@synthesize name;
@synthesize latitude;
@synthesize longitude;
@synthesize address;
@synthesize zip;
@synthesize city;

- (void)dealloc
{
    [name release];
    [address release];
    [zip release];
    [city release];
    
    [super dealloc];
}

@end
