//
//  GeoManager.h
//  CodingExercise1
//
//  Created by JJ WEI on 12-08-06.
//  Copyright (c) 2012 Ice Whale Inc. All rights reserved.
//

#import <UIKit/UIKit.h>

@class GeoManager;

@protocol GeoManagerDelegate

- (void)geoManager:(GeoManager*)geoManager didFailWithError:(NSError*)error;
- (void)geoManager:(GeoManager*)geolManager didFindDeals:(NSArray*)results;

@end 

@interface GeoManager : NSObject

+ (GeoManager*)instance;
-(void)geoLocationForAddress:(NSString*)address delegate:(id<GeoManagerDelegate>)delegate;
+ (NSString*)parameterStringForDictionary:(NSDictionary*)parameters;

@end

