//
//  CustomTabBarController.m
//  CodingExercise1
//
//  Created by JJ WEI on 12-08-06.
//  Copyright (c) 2012 Ice Whale Inc. All rights reserved.
//

#import "CustomTabBarController.h"

@implementation CustomTabBarController

- (id)initWithCustomTabBarClass:(Class)class
{
    self = [super init];
    
    if (self)
    {
        customTabBar = [[class alloc] initWithCustomTabBarController:self];
        
        [self addCustomTabBar];
    }
        
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];

    [self addCustomTabBar];
}

- (void)setViewControllers:(NSArray*)viewControllers
{
    [self setViewControllers:viewControllers animated:NO];
}

- (void)setViewControllers:(NSArray*)viewControllers animated:(BOOL)animated
{
    if (viewControllers.count > 5)
    {
        [NSException raise:@"CustomTabBarController supports 5 tabs at most" format:nil];
    }
    
    [super setViewControllers:viewControllers animated:animated];
}

- (void)willRotateToInterfaceOrientation:(UIInterfaceOrientation)toInterfaceOrientation duration:(NSTimeInterval)duration
{
    [super willRotateToInterfaceOrientation:toInterfaceOrientation duration:duration];
    
    CGRect screenRect = UIScreen.mainScreen.bounds;
    
    [UIView animateWithDuration:duration animations:^{
    
        float height = customTabBar.frame.size.height;
    
        if (UIInterfaceOrientationIsPortrait(toInterfaceOrientation))
        {
            customTabBar.frame = CGRectMake(
                0, screenRect.size.height - height, screenRect.size.width, height
            );
        }
        else
        {
            customTabBar.frame = CGRectMake(
                0, screenRect.size.width - height, screenRect.size.height, height
            );
        }
    }];
}

- (void)addCustomTabBar
{
    if (self.tabBar && customTabBar)
    {
        float difference = customTabBar.frame.size.height - self.tabBar.frame.size.height;
        
        CGRect tabBarRect = CGRectMake(
            self.tabBar.frame.origin.x,
            self.tabBar.frame.origin.y - difference,
            customTabBar.frame.size.width,
            customTabBar.frame.size.height
        );
        
        customTabBar.frame = tabBarRect;
    
        [self.tabBar.superview addSubview:customTabBar];
        
        if (self.viewControllers.count > 0)
        {
            [customTabBar selectItemAtIndex:0];
        }
    }
}

- (void)userTappedItemAtIndex:(int)index
{
    if (index < self.viewControllers.count)
    {
        BOOL shouldSelect = YES;
        
        id<UITabBarControllerDelegate> delegate = self.delegate;
        
        UIViewController* controller = [self.viewControllers objectAtIndex:index];
        
        if ([delegate respondsToSelector:@selector(tabBarController:shouldSelectViewController:)])
        {
            shouldSelect = [delegate tabBarController:self shouldSelectViewController:controller];
        }
        
        if (shouldSelect)
        {       
            self.selectedIndex = index;
            
            if ([delegate respondsToSelector:@selector(tabBarController:didSelectViewController:)])
            {
                [delegate tabBarController:self didSelectViewController:controller];
            }
        }
    }
}

- (void)setSelectedIndex:(NSUInteger)selectedIndex
{
    [super setSelectedIndex:selectedIndex];
    
    [customTabBar selectItemAtIndex:selectedIndex];
}

@end
