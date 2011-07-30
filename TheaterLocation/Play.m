//
//  Play.m
//  TheaterLocation
//
//  Created by epinom on 28/07/11.
//  Copyright 2011 epinom. All rights reserved.
//

#import "Play.h"


@implementation Play

@synthesize id;
@synthesize title;
@synthesize theater;
@synthesize dateFrom;
@synthesize dateTo;
@synthesize distance;
@synthesize rating;
@synthesize publicationDate;
@synthesize valuations;
@synthesize urlImage;
@synthesize urlThumb;

- (void)dealloc
{
    [title release];
    [theater release];
    [dateFrom release];
    [dateTo release];
    [publicationDate release];
    [urlImage release];
    [urlThumb release];

    [super dealloc];
}

@end
