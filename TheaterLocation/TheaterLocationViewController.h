//
//  TheaterLocationViewController.h
//  TheaterLocation
//
//  Created by epinom on 27/07/11.
//  Copyright 2011 epinom. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreLocation/CoreLocation.h>
#import "Settings.h"

@interface TheaterLocationViewController : UIViewController <CLLocationManagerDelegate> 
{
    // Variables
    CLLocationManager *locationManager;
    BOOL isUserUpdateAction;
    BOOL isDataPlaylistLoaded;
    
    // Componentes
    IBOutlet UIActivityIndicatorView *activityIndicator;
}

@property (nonatomic, retain) IBOutlet UIActivityIndicatorView *activityIndicator;

- (void)startStandardUpdates;

@end
