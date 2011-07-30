//
//  TheaterLocationAppDelegate.h
//  TheaterLocation
//
//  Created by epinom on 27/07/11.
//  Copyright 2011 epinom. All rights reserved.
//

#import <UIKit/UIKit.h>

@class TheaterLocationViewController;

@interface TheaterLocationAppDelegate : NSObject <UIApplicationDelegate> {

}

@property (nonatomic, retain) IBOutlet UIWindow *window;
@property (nonatomic, retain) IBOutlet TheaterLocationViewController *viewController;
@property (nonatomic, retain) IBOutlet UINavigationController *navigationController;

@end
