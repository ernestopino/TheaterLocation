//
//  SessionsFormatter.m
//  TheaterLocation
//
//  Created by epinom on 30/07/11.
//  Copyright 2011 epinom. All rights reserved.
//

#import "SessionsFormatter.h"


@implementation SessionsFormatter

+ (NSArray *)transformTimeListIntoSessionList:(NSArray *)times
{
    // Creando tabla hash para relacionar las sesiones con una clave que sera el atributo "timeStamp" convertido a NSString
    NSMutableDictionary *mutableDictionay = [[[NSMutableDictionary alloc] init] autorelease];
    
    
    
    
    // Obteniendo listado de sesiones
    NSArray *sessions = [[NSArray alloc] initWithArray:[mutableDictionay allValues]];
    
    return sessions;
}

@end
