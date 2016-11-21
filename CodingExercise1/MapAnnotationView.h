//
//  MapAnnotationView.h
//  CodingExercise1
//
//  Created by JJ WEI on 12-08-06.
//  Copyright (c) 2012 Ice Whale Inc. All rights reserved.
//

#import <MapKit/MapKit.h>
#import "MapAnnotation.h"

@interface MapAnnotationView : MKAnnotationView
{
    MapAnnotation* mapAnnotation;
}

@property(strong) MapAnnotation* mapAnnotation;

@end
