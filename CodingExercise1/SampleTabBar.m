//
//  SampleTabBar.m
//  CodingExercise1
//
//  Created by JJ WEI on 12-08-06.
//  Copyright (c) 2012 Ice Whale Inc. All rights reserved.
//

#import "SampleTabBar.h"

@implementation SampleTabBar

@synthesize tabs;

- (IBAction)tabTapped:(UIButton*)button
{
    int index = [tabs indexOfObject:button];
    
    [self userTappedItemAtIndex:index];
}

- (void)selectItemAtIndex:(int)index
{
    for (int i = 0; i < tabs.count; i++)
    {
        UIButton* tab = [tabs objectAtIndex:i];
        
        if (i == index)
        {
            tab.selected = YES;
        }
        else
        {
            tab.selected = NO;
        }
    }
}

@end
