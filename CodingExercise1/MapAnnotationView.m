//
//  MapAnnotationView.m
//  CodingExercise1
//
//  Created by JJ WEI on 12-08-06.
//  Copyright (c) 2012 Ice Whale Inc. All rights reserved.
//

#import "MapAnnotationView.h"

// todo - update these values to customise the map marker

// sample files replace with real ones
#define MAP_MARKER_BACKGROUND_FILE_NAME     @"sample-map-thumbnail-background.png"
#define MAP_MARKER_MASK_FILE_NAME           @"sample-map-thumbnail-mask.png"

/* the difference between the center point of the image and the point on the
    image that points to the location (postive values move the marker down and to
    the right
*/
#define MAP_MARKER_CENTER_OFFSET_X          0
#define MAP_MARKER_CENTER_OFFSET_Y          -35

// the offset of the mask from the image
#define MAP_MARKER_MASK_BASE_OFFSET_X       5.0
#define MAP_MARKER_MASK_BASE_OFFSET_Y       5.5

@implementation MapAnnotationView

- (MapAnnotation*)mapAnnotation
{
    self.image = [UIImage imageNamed:MAP_MARKER_BACKGROUND_FILE_NAME];
    self.centerOffset = CGPointMake(MAP_MARKER_CENTER_OFFSET_X, MAP_MARKER_CENTER_OFFSET_Y);
    return mapAnnotation;
}

- (void)setMapAnnotation:(MapAnnotation*)_mapAnnotation
{
    mapAnnotation = _mapAnnotation;
    
    self.image = [UIImage imageNamed:MAP_MARKER_BACKGROUND_FILE_NAME];
    
    self.centerOffset = CGPointMake(MAP_MARKER_CENTER_OFFSET_X, MAP_MARKER_CENTER_OFFSET_Y);
    
    NSString* photoURL = mapAnnotation.iconURL;
    
    // todo - just for demonstration - remove
    
    photoURL = @"http://www.veryicon.com/icon/png/Application/Sleek%20XP%20Software/Yahoo%20Messenger.png";
    photoURL = @"http://media.smashingmagazine.com/images/pictures-photos/photos-37.jpg";
    photoURL = @"http://www.fineartmirrors.com/images/product/Tall.jpg";
    
  
}
@end
