//
//  ViewLoader.h
//  CodingExercise1
//
//  Created by JJ WEI on 12-08-06.
//  Copyright (c) 2012 Ice Whale Inc. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ViewLoader : NSObject

// loads a UIView from a nib file for a class
+ (UIView*)viewForObject:(NSObject*)object;

// loads a UIView from a nib file for a class at a certain index
+ (UIView*)viewForObject:(NSObject*)object atIndex:(int)index;

@end
