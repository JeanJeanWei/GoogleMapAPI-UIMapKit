//
//  MapAnnotation.m
//  CodingExercise1
//
//  Created by JJ WEI on 12-08-06.
//  Copyright (c) 2012 Ice Whale Inc. All rights reserved.
//

#import "MapAnnotation.h"

@implementation MapAnnotation 

@synthesize coordinate, title, subtitle;
@synthesize iconURL;

- (void)setCoordinate:(CLLocationCoordinate2D)_coordinate
{
    coordinate = _coordinate;
}

@end
