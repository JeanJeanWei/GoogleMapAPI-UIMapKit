//
//  MapView.m
//  CodingExercise1
//
//  Created by JJ WEI on 12-08-06.
//  Copyright (c) 2012 Ice Whale Inc. All rights reserved.
//

#import "MapView.h"
#import "MapAnnotation.h"
#import "MapAnnotationView.h"

@implementation MapView

- (void)setDelegate:(id<MKMapViewDelegate>)_delegate
{
    if (_delegate != self)
    {
        superDelegate = _delegate;
    }
    
    super.delegate = self;
}

- (void)awakeFromNib
{
    self.delegate = self;
}

/******************************************************************************/
#pragma mark -
#pragma mark MKMapViewDelegate
/******************************************************************************/

- (void)mapView:(MKMapView*)mapView regionWillChangeAnimated:(BOOL)animated
{
    if ([superDelegate respondsToSelector:@selector(mapView:regionWillChangeAnimated:)])
    {
        [superDelegate mapView:mapView regionWillChangeAnimated:animated];
    }
}

- (void)mapView:(MKMapView*)mapView regionDidChangeAnimated:(BOOL)animated
{
    if ([superDelegate respondsToSelector:@selector(mapView:regionDidChangeAnimated:)])
    {
        [superDelegate mapView:mapView regionWillChangeAnimated:animated];
    }
}

- (void)mapViewWillStartLoadingMap:(MKMapView*)mapView
{
    if ([superDelegate respondsToSelector:@selector(mapViewWillStartLoadingMap:)])
    {
        [superDelegate mapViewWillStartLoadingMap:mapView];
    }
}

- (void)mapViewDidFinishLoadingMap:(MKMapView*)mapView
{
    if ([superDelegate respondsToSelector:@selector(mapViewDidFinishLoadingMap:)])
    {
        [superDelegate mapViewDidFinishLoadingMap:mapView];
    }
}

- (void)mapViewDidFailLoadingMap:(MKMapView*)mapView withError:(NSError*)error
{
    if ([superDelegate respondsToSelector:@selector(mapViewDidFailLoadingMap:withError:)])
    {
        [superDelegate mapViewDidFailLoadingMap:mapView withError:error];
    }
}

- (MKAnnotationView*)mapView:(MKMapView*)mapView viewForAnnotation:(id<MKAnnotation>)annotation
{
    MKAnnotationView* annotationView = nil;
    
    if ([annotation isKindOfClass:[MapAnnotation class]])
    {
        MapAnnotation* mapAnnotation = (MapAnnotation*)annotation;
        
        MapAnnotationView* mapAnnotationView = (MapAnnotationView*)[mapView dequeueReusableAnnotationViewWithIdentifier:@"annotation"];
        
        if (!mapAnnotationView)
        {
            mapAnnotationView = [[MapAnnotationView alloc] initWithAnnotation:annotation reuseIdentifier:@"annotation"];
        }
        
        mapAnnotationView.mapAnnotation = mapAnnotation;
        
        annotationView = mapAnnotationView;
    }

    if (!annotationView)
    {
        if ([superDelegate respondsToSelector:@selector(mapView:viewForAnnotation:)])
        {
            annotationView = [superDelegate mapView:mapView viewForAnnotation:annotation];
        }
    }
    
    return annotationView;
}

- (void)mapView:(MKMapView*)mapView didAddAnnotationViews:(NSArray*)views
{
    if ([superDelegate respondsToSelector:@selector(mapView:didAddAnnotationViews:)])
    {
        [superDelegate mapView:mapView didAddAnnotationViews:views];
    }
}

- (void)mapView:(MKMapView*)mapView annotationView:(MKAnnotationView*)view calloutAccessoryControlTapped:(UIControl*)control
{
    if ([superDelegate respondsToSelector:@selector(mapView:annotationView:calloutAccessoryControlTapped:)])
    {
        [superDelegate mapView:mapView annotationView:view calloutAccessoryControlTapped:control];
    }
}

- (void)mapView:(MKMapView*)mapView didSelectAnnotationView:(MKAnnotationView*)view
{
    if ([superDelegate respondsToSelector:@selector(mapView:didSelectAnnotationView:)])
    {
        [superDelegate mapView:mapView didSelectAnnotationView:view];
    }
}

- (void)mapView:(MKMapView*)mapView didDeselectAnnotationView:(MKAnnotationView*)view
{
    if ([superDelegate respondsToSelector:@selector(mapView:didDeselectAnnotationView:)])
    {
        [superDelegate mapView:mapView didDeselectAnnotationView:view];
    }
}

- (void)mapViewWillStartLocatingUser:(MKMapView*)mapView
{
    if ([superDelegate respondsToSelector:@selector(mapViewWillStartLocatingUser:)])
    {
        [superDelegate mapViewWillStartLocatingUser:mapView];
    }
}

- (void)mapViewDidStopLocatingUser:(MKMapView*)mapView
{
    if ([superDelegate respondsToSelector:@selector(mapViewDidStopLocatingUser:)])
    {
        [superDelegate mapViewDidStopLocatingUser:mapView];
    }
}

- (void)mapView:(MKMapView*)mapView didUpdateUserLocation:(MKUserLocation*)userLocation
{
    if ([superDelegate respondsToSelector:@selector(mapView:didUpdateUserLocation:)])
    {
        [superDelegate mapView:mapView didUpdateUserLocation:userLocation];
    }
}

- (void)mapView:(MKMapView*)mapView didFailToLocateUserWithError:(NSError*)error
{
    if ([superDelegate respondsToSelector:@selector(mapView:didFailToLocateUserWithError:)])
    {
        [superDelegate mapView:mapView didFailToLocateUserWithError:error];
    }
}

- (void)mapView:(MKMapView*)mapView annotationView:(MKAnnotationView*)view didChangeDragState:(MKAnnotationViewDragState)newState fromOldState:(MKAnnotationViewDragState)oldState
{
    if ([superDelegate respondsToSelector:@selector(mapView:annotationView:didChangeDragState:fromOldState:)])
    {
        [superDelegate mapView:mapView annotationView:view didChangeDragState:newState fromOldState:oldState];
    }
}

- (MKOverlayView*)mapView:(MKMapView*)mapView viewForOverlay:(id<MKOverlay>)overlay
{
    MKOverlayView* overlayView = nil;
    
    if ([superDelegate respondsToSelector:@selector(mapView:viewForOverlay:)])
    {
        overlayView = [superDelegate mapView:mapView viewForOverlay:overlay];
    }
    
    return overlayView;
}

- (void)mapView:(MKMapView*)mapView didAddOverlayViews:(NSArray*)overlayViews
{
    if ([superDelegate respondsToSelector:@selector(mapView:didAddOverlayViews:)])
    {
        [superDelegate mapView:mapView didAddOverlayViews:overlayViews];
    }
}

- (void)mapView:(MKMapView*)mapView didChangeUserTrackingMode:(MKUserTrackingMode)mode animated:(BOOL)animated
{
    if ([superDelegate respondsToSelector:@selector(mapView:didChangeUserTrackingMode:animated:)])
    {
        [superDelegate mapView:mapView didChangeUserTrackingMode:mode animated:animated];
    }
}

@end
