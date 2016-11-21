//
//  MapView.h
//  CodingExercise1
//
//  Created by JJ WEI on 12-08-06.
//  Copyright (c) 2012 Ice Whale Inc. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MapKit/MapKit.h>
#import "MapAnnotation.h"

@interface MapView : MKMapView<MKMapViewDelegate>
{
    id<MKMapViewDelegate> superDelegate;
}

// use the addAnnotation selector of the base class to add a marker to the map

@end
