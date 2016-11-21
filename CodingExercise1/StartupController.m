//
//  StartupController.m
//  CodingExercise1
//
//  Created by JJ WEI on 12-08-06.
//  Copyright (c) 2012 Ice Whale Inc. All rights reserved.
//

#import "StartupController.h"
#import "CustomTabBarController.h"


#import "SampleTabBar.h"
#import "SampleViewController.h"
#import "SampleMapViewController.h"

@implementation StartupController

+ (StartupController*)instance
{
    static StartupController* instance = nil;
    
    if (!instance)
    {
        instance = [StartupController new];
    }
    
    return instance;
}

- (UIViewController*)startingViewController
{
    CustomTabBarController* tabBarController = [[CustomTabBarController alloc] initWithCustomTabBarClass:SampleTabBar.class];
    
    tabBarController.viewControllers = [NSArray arrayWithObjects:
                                        [SampleViewController new],
                                        [SampleMapViewController new],
                                        nil];
    
    return tabBarController;
}

@end
