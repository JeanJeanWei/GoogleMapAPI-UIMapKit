//
//  View.m
//  CodingExercise1
//
//  Created by JJ WEI on 12-08-06.
//  Copyright (c) 2012 Ice Whale Inc. All rights reserved.
//

#import "View.h"
#import "ViewLoader.h"

@implementation View

- (id)init
{
    self = (View*)[ViewLoader viewForObject:self];
    
    return self;
}

@end
