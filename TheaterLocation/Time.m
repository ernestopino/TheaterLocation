//
//  Time.m
//  TheaterLocation
//
//  Created by epinom on 30/07/11.
//  Copyright 2011 epinom. All rights reserved.
//

#import "Time.h"


@implementation Time

@synthesize stamp;
@synthesize start;
@synthesize end;

- (void)dealloc
{
    [start release];
    [end release];
    [super dealloc];
}


@end
