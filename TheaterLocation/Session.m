//
//  Session.m
//  TheaterLocation
//
//  Created by epinom on 30/07/11.
//  Copyright 2011 epinom. All rights reserved.
//

#import "Session.h"


@implementation Session

@synthesize formattedDate;
@synthesize formattedTimes;
@synthesize times;

- (void)dealloc 
{
    [formattedDate release];
    [formattedTimes release];
    [super dealloc];
}

@end
