//
//  Settings.h
//  TheaterLocation
//
//  Created by epinom on 27/07/11.
//  Copyright 2011 epinom. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Foundation/Foundation.h>


#pragma mark - Variables globales

#define RUNNING_LOCAL_APPLICATION YES   // NO cuando la aplicacion se despliega sobre un dispositivo real
#define SEARCH_RADIOUS_VALUE 2
#define LOCAL_USER_LATITUDE 40.416641
#define LOCAL_USER_LONGITUDE -3.703147


#pragma mark - URLs servicios

/*
 
 Obras
 -----
 
 ### Listado de obras
 
 URL base:
 
 http://173.193.199.140:5000/api/plays/
 ejemplo: http://173.193.199.140:5000/api/plays/?n=10 (listado con 10 obras)
 ejemplo: http://173.193.199.140:5000/api/plays/?ll=40.4162488727598,-3.702719807624817&r=2 (lista de obras que están dentro en un radio de 2 kms, a partir de la latitud y longitud del usuario)
 ejemplo: http://173.193.199.140:5000/api/plays/?f=json (listado con obras en formato JSON, por defecto viene en XML)
 
 Parámetros:
 
 * p: Número de página que mostrar (por defecto página 1)
 * n: Número de obras por página (por defecto 15)
 * ll: Par ordenado (latitud, longitud) ej: ll=####,####
 * r: Obras solo a <r> kilómetros de la posición <ll> (para sacar la distancia son necesario estos dos parametros)
 * f: Formato de la respuesta <json|xml>, por defecto <xml>
 
 */

#define SERVER_DOMAIN @"http://173.193.199.140:5000"
#define PLAY_LIST_BASE_URL @"/api/plays/"