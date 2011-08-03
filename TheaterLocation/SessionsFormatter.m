//
//  SessionsFormatter.m
//  TheaterLocation
//
//  Created by epinom on 30/07/11.
//  Copyright 2011 epinom. All rights reserved.
//

#import "SessionsFormatter.h"
#import "Time.h"
#import "Session.h"


@implementation SessionsFormatter

+ (NSArray *)transformTimeListIntoSessionList:(NSArray *)times
{
    NSLog(@"SessionsFormatter->transformTimeListIntoSessionList()");
    
    // Creando tabla hash para relacionar las sesiones con una clave que sera el atributo "timeStamp" convertido a NSString
    NSMutableDictionary *mutableDictionay = [[[NSMutableDictionary alloc] init] autorelease];
    
    Time *item;
    NSMutableArray *mutableTimes = [times mutableCopy]; 
    for (item in times) 
    { 
        NSString *key = [[NSNumber numberWithLong:item.stamp] stringValue];
        if (![mutableDictionay objectForKey:key]) 
        {
            // Formateando la fecha
            NSDate *date = [NSDate dateWithTimeIntervalSince1970:item.stamp];
            NSLocale *esLocale = [[NSLocale alloc] initWithLocaleIdentifier:@"es_ES"];
            
            NSDateFormatter *dateFormatter = [[[NSDateFormatter alloc] init] autorelease];
            [dateFormatter setTimeStyle:NSDateFormatterNoStyle];
            [dateFormatter setDateFormat:@"'['EEE'] 'dd' de 'MMMM' de 'yyyy"];
            [dateFormatter setLocale:esLocale];
            
            // Formateando los horarios
            NSString *formattedTime = [NSString stringWithFormat:@"%@h - %@h", item.start, item.end];
            
            Session *session = [[Session alloc] init];
            session.formattedDate = [NSString stringWithFormat:@"%@", [dateFormatter stringFromDate:date]];
            session.times = [times copy];
            session.formattedTimes = [[NSMutableArray alloc] initWithObjects:formattedTime, nil];

            // Adicionando item al diccionario
            [mutableDictionay setObject:session forKey:key];
        } 
        else 
        {
            // Recuperando objeto con esa clave
            Session *tmpSession = [mutableDictionay objectForKey:key];
            
            // Formateando los horarios
            NSString *formattedTime = [NSString stringWithFormat:@"%@h - %@h", item.start, item.end];
            
            // Adicionando nuevo horario a la sesion
            [tmpSession.formattedTimes addObject:formattedTime];
        }         
    } 
    
    // Eliminando la copia mutable del listado
    [mutableTimes removeAllObjects];
    [mutableTimes release];
    
    // Obteniendo listado de sesiones
    NSArray *sessions = [[NSArray alloc] initWithArray:[mutableDictionay allValues]];
    
    // Trazas
    Session *session;
    for (session in sessions) 
    {
        NSLog(@"--------------------------------");
        NSLog(@"Date: %@", session.formattedDate);
        NSMutableString * result = [[NSMutableString alloc] init];
        for (NSObject *obj in session.formattedTimes)
            [result appendFormat:@"| %@ |", [obj description]];
        NSLog(@"Sessions: %@", result);
        NSLog(@"--------------------------------");
    }
    
    return sessions;
}

@end










