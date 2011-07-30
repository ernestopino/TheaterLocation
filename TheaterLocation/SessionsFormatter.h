//
//  SessionsFormatter.h
//  TheaterLocation
//
//  Created by epinom on 30/07/11.
//  Copyright 2011 epinom. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface SessionsFormatter : NSObject {
    
}

+ (NSArray *)transformTimeListIntoSessionList:(NSArray *)times;

@end
