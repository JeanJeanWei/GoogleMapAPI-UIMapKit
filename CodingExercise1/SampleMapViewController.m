//
//  SampleMapViewController.m
//  CodingExercise1
//
//  Created by JJ WEI on 12-08-06.
//  Copyright (c) 2012 Ice Whale Inc. All rights reserved.
//

#import "SampleMapViewController.h"

#import "SampleModel.h"

@implementation SampleMapViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    // go to North America
    MKCoordinateRegion newRegion;
    newRegion.center.latitude = 37.37;
    newRegion.center.longitude = -96.24;
    newRegion.span.latitudeDelta = 28.49;
    newRegion.span.longitudeDelta = 31.025;
    
    [mapView setRegion:newRegion animated:NO];

}

- (void)viewDidAppear:(BOOL)animated
{
    NSArray *oldAnnotations = mapView.annotations;
    [mapView removeAnnotations:oldAnnotations]; 
    // AddressModel *t = [AddressManager.instance.data.addressData objectAtIndex:0];
    //  mapView.region = MKCoordinateRegionMake(
    //    CLLocationCoordinate2DMake(t.lat, t.lng),
    //     MKCoordinateSpanMake(100, 100)
    // );
    // SampleModel *list = address
    for (int i = 0; i<AddressManager.instance.data.addressData.count; i++) 
    {
        AddressModel *temp = [AddressManager.instance.data.addressData objectAtIndex:i];
        SampleMapAnnotation *ann = [[SampleMapAnnotation alloc] initWithAddress:temp];
        [mapView addAnnotation:ann];
    }
    //  [mapView addAnnotation:[SampleMapAnnotation new]];
}
/******************************************************************************/
#pragma mark -
#pragma mark MKMapViewDelegate
/******************************************************************************/

- (void)mapView:(MKMapView *)mapView didSelectAnnotationView:(MKAnnotationView *)view
{
   //view.annotation
    
    UILabel *d = [[UILabel alloc] initWithFrame:CGRectMake(0, -20, 50, 30)];
    d.backgroundColor = [UIColor orangeColor];
    d.font = [UIFont systemFontOfSize:10];
    d.text = [view.annotation subtitle];
    d.numberOfLines = 0;
    [view addSubview:d];
    
    NSLog(@"Marker Selected");
}


- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
    return YES;
}
@end
