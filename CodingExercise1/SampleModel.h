//
//  SampleModel.h
//  CodingExercise1
//
//  Created by JJ WEI on 12-08-06.
//  Copyright (c) 2012 Ice Whale Inc. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MapAnnotation.h"



@interface SampleModel : NSObject <NSCoding>
{
    NSMutableArray* addressData;
    
}

@property(strong) NSMutableArray* addressData;



@end

@interface AddressModel : NSObject <NSCoding>
{
    NSString* address;
    NSString* description;
    float lat;
    float lng;
}

@property(strong) NSString* address;;
@property(strong) NSString* description;;
@property(assign) float lat;
@property(assign) float lng;

@end

@interface SampleAPIResponse : NSObject

@property(strong) NSString* status;
@property(strong) NSString* method;

@end

@interface SampleMapAnnotation : MapAnnotation
{
    AddressModel *addModel;
}

- (id)initWithAddress:(AddressModel*)a;
@end
