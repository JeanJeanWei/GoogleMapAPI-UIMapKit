//
//  CustomTabBar.m
//  CodingExercise1
//
//  Created by JJ WEI on 12-08-06.
//  Copyright (c) 2012 Ice Whale Inc. All rights reserved.
//

#import "CustomTabBar.h"
#import "CustomTabBarController.h"

@implementation CustomTabBar

- (id)initWithCustomTabBarController:(CustomTabBarController*)_tabBarController
{
    self = [super init];
    
    if (self)
    {
        tabBarController = _tabBarController;
    }
    
    return self;
}

- (int)selectedIndex
{
    return tabBarController.selectedIndex;
}

- (void)userTappedItemAtIndex:(int)index
{
    [tabBarController userTappedItemAtIndex:index];
}

- (void)selectItemAtIndex:(int)index
{
    // overridden in subclass
}

@end
