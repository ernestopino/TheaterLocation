//
//  Session.h
//  TheaterLocation
//
//  Created by epinom on 30/07/11.
//  Copyright 2011 epinom. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface Session : NSObject {
    NSString *formattedDate;
    NSArray *formattedTimes;
    NSArray *times;
}

@property (nonatomic, retain) NSString *formattedDate;
@property (nonatomic, retain) NSArray *formattedTimes;
@property (nonatomic, retain) NSArray *times;

@end
