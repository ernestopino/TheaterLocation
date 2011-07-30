//
//  Play.h
//  TheaterLocation
//
//  Created by epinom on 28/07/11.
//  Copyright 2011 epinom. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Theater.h"

@interface Play : NSObject 
{
    int id;
    NSString *title;
    Theater *theater;
    NSString *dateFrom;
    NSString *dateTo;
    float distance;
    int rating;
    NSDate *publicationDate;
    int valuations;
    NSString *urlImage;
    NSString *urlThumb;
}

@property (nonatomic, assign) int id;
@property (nonatomic, retain) NSString *title;
@property (nonatomic, retain) Theater *theater;
@property (nonatomic, retain) NSString *dateFrom;
@property (nonatomic, retain) NSString *dateTo;
@property (nonatomic, assign) float distance;
@property (nonatomic, assign) int rating;
@property (nonatomic, retain) NSDate *publicationDate;
@property (nonatomic, assign) int valuations;
@property (nonatomic, retain) NSString *urlImage;
@property (nonatomic, retain) NSString *urlThumb;

@end
