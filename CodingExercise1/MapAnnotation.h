//
//  MapAnnotation.h
//  CodingExercise1
//
//  Created by JJ WEI on 12-08-06.
//  Copyright (c) 2012 Ice Whale Inc. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <MapKit/MapKit.h>

@interface MapAnnotation : NSObject<MKAnnotation>
{
    CLLocationCoordinate2D coordinate;
    NSString *title; 
    NSString *subtitle;
}

/*
    This is a base class for models that are displayed on a map
    
    The child class must set the coordinate to set the physical location on
    the map, and also implement the iconURL property, to determine which
    picture is displayed for the map marker.
*/

@property(nonatomic,readonly) CLLocationCoordinate2D coordinate;
@property(strong) NSString* iconURL;
@property(nonatomic,copy) NSString *title; 
@property(nonatomic,copy) NSString *subtitle;
- (void)setCoordinate:(CLLocationCoordinate2D)coordinate;

@end
