//
//  AddressManager.h
//  CodingExercise1
//
//  Created by JJ WEI on 12-08-06.
//  Copyright (c) 2012 Ice Whale Inc. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SampleModel.h"
#import "GeoManager.h"

@class AddressManager;

@interface AddressManager : NSObject <GeoManagerDelegate>
{
    SampleModel *data;
    AddressModel *tempAddress;
}

@property (strong) SampleModel *data;

+ (AddressManager*)instance;
- (void)startNewProgress;
- (void)manageProgress;
- (void)addAddress:(NSString*)a andDescription:(NSString*)d;
- (void)deleteAddress:(int)idx;

@end
