//
//  ViewLoader.m
//  CodingExercise1
//
//  Created by JJ WEI on 12-08-06.
//  Copyright (c) 2012 Ice Whale Inc. All rights reserved.
//

#import "ViewLoader.h"

@implementation ViewLoader

+ (UIView*)viewForObject:(NSObject*)object
{
    return [ViewLoader viewForObject:object atIndex:0];
}

+ (UIView*)viewForObject:(NSObject*)object atIndex:(int)index
{
    NSString* xibType = nil;
    
    if (UIDevice.currentDevice.userInterfaceIdiom == UIUserInterfaceIdiomPhone)
    {
        xibType = @"iPhone";
    }
    else
    {
        xibType = @"iPad";
    }
    
    NSArray* objects = nil;
        
    NSString* xibName = [NSString stringWithFormat:@"%@-%@", object.class.description, xibType];
    
    NSString* path = [NSBundle.mainBundle pathForResource:xibName ofType:@"nib"];
    
    if (path)
    {
        objects = [NSBundle.mainBundle loadNibNamed:xibName owner:object options:nil];
    }
    else
    {
        objects = [NSBundle.mainBundle loadNibNamed:object.class.description owner:object options:nil];
    }
    
    return [objects objectAtIndex:index];
}

@end
