//
//  TheaterLocationViewController.m
//  TheaterLocation
//
//  Created by epinom on 27/07/11.
//  Copyright 2011 epinom. All rights reserved.
//

#import "TheaterLocationViewController.h"
#import "ASIHTTPRequest.h"
#import "Time.h"
#import "SessionsFormatter.h"

@implementation TheaterLocationViewController

@synthesize activityIndicator;

- (void)dealloc
{
    [activityIndicator release];
    [super dealloc];
}

- (void)didReceiveMemoryWarning
{
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - View lifecycle

// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad
{
    [super viewDidLoad];
    
    // Inicializando propiedades
    isUserUpdateAction = YES; 
    isDataPlaylistLoaded = NO;
    
    [self startStandardUpdates];
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

#pragma mark - CLLocationManagerDelegate

// Delegate method from the CLLocationManagerDelegate protocol.
- (void)locationManager:(CLLocationManager *)manager didUpdateToLocation:(CLLocation *)newLocation fromLocation:(CLLocation *)oldLocation
{
    // If it's a relatively recent event, turn off updates to save power
    NSDate* eventDate = newLocation.timestamp;
    NSTimeInterval howRecent = [eventDate timeIntervalSinceNow];
    if (abs(howRecent) < 15.0 && isUserUpdateAction == YES)
    {
        NSLog(@"latitude %+.6f, longitude %+.6f\n",
              newLocation.coordinate.latitude,
              newLocation.coordinate.longitude);
        
        // Actualizando la variable de control de actualizacion 
        isUserUpdateAction = NO;
        
        // Configurando peticion al servidor 
        NSString *urlForService = nil;
        NSURL *url = nil;
        if (RUNNING_LOCAL_APPLICATION) {
            urlForService = [NSString stringWithFormat:@"%@%@?ll=%f,%f&r=%d", SERVER_DOMAIN, PLAY_LIST_BASE_URL, 
                             LOCAL_USER_LATITUDE, LOCAL_USER_LONGITUDE, SEARCH_RADIOUS_VALUE];
            url = [NSURL URLWithString:urlForService];
        } else {
            urlForService = [NSString stringWithFormat:@"%@%@?ll=%f,%f&r=%d", SERVER_DOMAIN, PLAY_LIST_BASE_URL, 
                                       newLocation.coordinate.latitude, newLocation.coordinate.longitude, SEARCH_RADIOUS_VALUE];
            url = [NSURL URLWithString:urlForService];
        }
        
       // NSLog(url);
        
        ASIHTTPRequest *request = [ASIHTTPRequest requestWithURL:url];
        [request setDelegate:self];
        [request startAsynchronous];        
    }
    // else skip the event and process the next one.
}

#pragma mark - Custom methods

- (void)startStandardUpdates
{
    // Create the location manager if this object does not
    // already have one.
    if (nil == locationManager)
        locationManager = [[CLLocationManager alloc] init];
    
    locationManager.delegate = self;
    locationManager.desiredAccuracy = kCLLocationAccuracyKilometer;
    
    // Set a movement threshold for new events.
    locationManager.distanceFilter = 500;
    
    [locationManager startUpdatingLocation];
}

-(void)fadeOut:(UIView*)viewToDissolve withDuration:(NSTimeInterval)duration andWait:(NSTimeInterval)wait
{
    [UIView beginAnimations: @"Fade Out" context:nil];
    
    // wait for time before begin
    [UIView setAnimationDelay:wait];
    
    // druation of animation
    [UIView setAnimationDuration:duration];
    viewToDissolve.alpha = 0.0;
    [UIView commitAnimations];
}

-(void)fadeIn:(UIView*)viewToFadeIn withDuration:(NSTimeInterval)duration andWait:(NSTimeInterval)wait
{
    [UIView beginAnimations: @"Fade In" context:nil];
    
    // wait for time before begin
    [UIView setAnimationDelay:wait];
    
    // druation of animation
    [UIView setAnimationDuration:duration];
    viewToFadeIn.alpha = 1;
    [UIView commitAnimations];
    
}

#pragma mark -
#pragma mark Funciones de CALLBACK de la petición de datos remotos

- (void)requestFinished:(ASIHTTPRequest *)request
{	
    NSLog(@"TheaterLocationViewController->requestFinished()");
    
    // Recuperando los datos en formato BINARIO
	NSData *responseData = [request responseData];
    NSString *responseString = [[NSString alloc] initWithData:responseData encoding:NSUTF8StringEncoding];
    NSLog(@"%@", responseString);
    
    // Actualizando variable de control de carga de datos externos
    isDataPlaylistLoaded = YES;
    
    // TODO: Parseando los datos recibidos
    
    
    
    // Deteniendo el indicador de actividad
    [activityIndicator stopAnimating];
    
    // Invisibilizando 
    
    // FadeOut la vista de bienvenida y eliminada de la vista superior
    [UIView animateWithDuration:1.0
                          delay: 0.0
                        options: UIViewAnimationOptionCurveEaseIn
                     animations:^{
                         self.view.alpha = 0.0;
                     }
                     completion:^(BOOL finished){
                         NSLog(@"Eliminando vista de bienvenida...");
                         
                         NSDate *date = [NSDate dateWithTimeIntervalSince1970:1311717600];
                         
                         NSLocale *esLocale = [[NSLocale alloc] initWithLocaleIdentifier:@"es_ES"];
                         
                         NSDateFormatter *dateFormatter = [[[NSDateFormatter alloc] init] autorelease];
                         [dateFormatter setTimeStyle:NSDateFormatterNoStyle];
                         [dateFormatter setDateFormat:@"'['EEE'] 'dd' de 'MMMM' de 'yyyy"];
                         [dateFormatter setLocale:esLocale];
                         
                         NSLog(@"Date for locale %@: %@",
                               [[dateFormatter locale] localeIdentifier], [dateFormatter stringFromDate:date]);
                         
                         // Creando datos de funciones, simulando parseo de XML y conversion en listado de objetos Time
                         Time *time1 = [[Time alloc] init];
                         time1.stamp = 1311717600;
                         time1.start = @"15:00";
                         time1.end = @"17:00";
                         
                         Time *time2 = [[Time alloc] init];
                         time2.stamp = 1311717600;
                         time2.start = @"20:00";
                         time2.end = @"22:00";
                         
                         NSArray *times = [[NSArray alloc] initWithObjects:time1, time2, nil];
                         [SessionsFormatter transformTimeListIntoSessionList:times];
                         
                         /*
                          <times>
                            <time>
                                <date>1311717600</date>
                                <start>15:00</start>
                                <end>17:00</end>
                            </time>
                            <time>
                                <date>1311717600</date>
                                <start>20:00</start>
                                <end>22:00</end>
                            </time>
                          </times>
                          */
                         
                        [self.view removeFromSuperview];
                     }];
}

- (void)requestFailed:(ASIHTTPRequest *)request
{
    NSLog(@"TheaterLocationViewController->requestFailed()");
    
    // Cambiando nivel de visibilidad del indicador de actividad
    //[activityLabel setHidden:YES];
    
}

@end
