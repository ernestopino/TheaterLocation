//
//  Theater.h
//  TheaterLocation
//
//  Created by epinom on 28/07/11.
//  Copyright 2011 epinom. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface Theater : NSObject 
{
    int id;
    NSString *name;
    float latitude;
    float longitude;
    NSString *address;
    NSString *zip;
    NSString *city;
}

@property (nonatomic, assign) int id;
@property (nonatomic, retain) NSString *name;
@property (nonatomic, assign) float latitude;
@property (nonatomic, assign) float longitude;
@property (nonatomic, retain) NSString *address;
@property (nonatomic, retain) NSString *zip;
@property (nonatomic, retain) NSString *city;

@end
