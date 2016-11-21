//
//  StartupController.h
//  CodingExercise1
//
//  Created by JJ WEI on 12-08-06.
//  Copyright (c) 2012 Ice Whale Inc. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface StartupController : NSObject

+ (StartupController*)instance;

// update to specify the starting view controller for the application
- (UIViewController*)startingViewController;

@end
