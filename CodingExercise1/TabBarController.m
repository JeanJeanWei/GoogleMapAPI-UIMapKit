//
//  TabBarController.m
//  CodingExercise1
//
//  Created by JJ WEI on 12-08-06.
//  Copyright (c) 2012 Ice Whale Inc. All rights reserved.
//

#import "TabBarController.h"

@implementation TabBarController

- (void)willRotateToInterfaceOrientation:(UIInterfaceOrientation)toInterfaceOrientation duration:(NSTimeInterval)duration
{
    [super willRotateToInterfaceOrientation:toInterfaceOrientation duration:duration];
    
    for (UIViewController* viewController in self.viewControllers)
    {
        if (viewController != self.selectedViewController)
        {
            [viewController willRotateToInterfaceOrientation:toInterfaceOrientation duration:0];
        }
    }
}

- (void)didRotateFromInterfaceOrientation:(UIInterfaceOrientation)fromInterfaceOrientation
{    
    [super didRotateFromInterfaceOrientation:fromInterfaceOrientation];
    
    for (UIViewController* viewController in self.viewControllers)
    {
        if (viewController != self.selectedViewController)
        {
            [viewController didRotateFromInterfaceOrientation:fromInterfaceOrientation];
        }
    }
}

@end
