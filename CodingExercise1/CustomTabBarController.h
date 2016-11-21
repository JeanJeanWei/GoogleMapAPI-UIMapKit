//
//  CustomTabBarController.h
//  CodingExercise1
//
//  Created by JJ WEI on 12-08-06.
//  Copyright (c) 2012 Ice Whale Inc. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TabBarController.h"
#import "CustomTabBar.h"

@interface CustomTabBarController : TabBarController
{
    CustomTabBar* customTabBar;
}

// initialises the custom tabbar with a custom tab bar class
- (id)initWithCustomTabBarClass:(Class)class;

// called internally by the custom tab bar
- (void)userTappedItemAtIndex:(int)index;

@end
