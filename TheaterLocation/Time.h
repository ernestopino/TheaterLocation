//
//  Time.h
//  TheaterLocation
//
//  Created by epinom on 30/07/11.
//  Copyright 2011 epinom. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface Time : NSObject {
    long stamp;
    NSString *start;
    NSString *end;
}

@property (nonatomic, assign) long stamp;
@property (nonatomic, retain) NSString *start;
@property (nonatomic, retain) NSString *end;

@end
