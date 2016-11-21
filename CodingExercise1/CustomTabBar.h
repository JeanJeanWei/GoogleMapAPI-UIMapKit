//
//  CustomTabBar.h
//  CodingExercise1
//
//  Created by JJ WEI on 12-08-06.
//  Copyright (c) 2012 Ice Whale Inc. All rights reserved.
//

#import "View.h"

@class CustomTabBarController;



@interface CustomTabBar : View
{
    CustomTabBarController* tabBarController;
}

@property(readonly) int selectedIndex;

- (id)initWithCustomTabBarController:(CustomTabBarController*)tabBarController;

// called by child classes
- (void)userTappedItemAtIndex:(int)index;

// override this method to set the state for an item
- (void)selectItemAtIndex:(int)index;

@end
