//
//  SampleTabBar.h
//  CodingExercise1
//
//  Created by JJ WEI on 12-08-06.
//  Copyright (c) 2012 Ice Whale Inc. All rights reserved.
//

#import "CustomTabBar.h"

@interface SampleTabBar : CustomTabBar

@property(strong) IBOutletCollection(UIButton) NSArray* tabs;

- (IBAction)tabTapped:(UIButton*)button;

@end
