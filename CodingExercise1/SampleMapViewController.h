//
//  SampleMapViewController.h
//  CodingExercise1
//
//  Created by JJ WEI on 12-08-06.
//  Copyright (c) 2012 Ice Whale Inc. All rights reserved.
//

#import "ViewController.h"
#import "MapView.h"
#import "AddressManager.h"
@interface SampleMapViewController : ViewController<MKMapViewDelegate>
{
    IBOutlet MapView* mapView;
}

@end
