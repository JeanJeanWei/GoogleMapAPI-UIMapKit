//
//  SampleModel.m
//  CodingExercise1
//
//  Created by JJ WEI on 12-08-06.
//  Copyright (c) 2012 Ice Whale Inc. All rights reserved.
//

#import "SampleModel.h"



@implementation SampleModel

@synthesize addressData;

- (id)init
{
    self = [super init];
    
    if (self)
    {
        addressData = [NSMutableArray new];
        
    }
    return self;
}

- (id) initWithCoder: (NSCoder *)coder
{
    if (self = [super init])
    {
        addressData = [coder decodeObjectForKey:@"addressData"];
    }
    return self;
}
- (void) encodeWithCoder: (NSCoder *)coder
{
    [coder encodeObject:addressData forKey:@"addressData"];
}
@end



@implementation AddressModel

@synthesize address;
@synthesize description;
@synthesize lat;
@synthesize lng;

- (id)init
{
    self = [super init];
    
    if (self)
    {
        
        
    }
    return self;
}

- (id) initWithCoder: (NSCoder *)coder
{
    if (self = [super init])
    {
        
        address = [coder decodeObjectForKey:@"address"];
        description = [coder decodeObjectForKey:@"description"];
        lat = [coder decodeFloatForKey:@"lat"];
        lng = [coder decodeFloatForKey:@"lng"];
    }
    return self;
}
- (void) encodeWithCoder: (NSCoder *)coder
{
    
    [coder encodeObject:address forKey:@"address"];
    [coder encodeObject:description forKey:@"description"];
    [coder encodeFloat:lat forKey:@"lat"];
    [coder encodeFloat:lng forKey:@"lng"];
}
@end


@implementation SampleAPIResponse

@synthesize status;
@synthesize method;

@end

@implementation SampleMapAnnotation

- (id)initWithAddress:(AddressModel*)a
{
    self = [super init];
    
    if (self)
    {
      //  self.coordinate = CLLocationCoordinate2DMake(43.652527, -79.381961);
        self.coordinate = CLLocationCoordinate2DMake(a.lat, a.lng);
        self.title = a.address;
        self.subtitle = a.description;
    }
    
    return self;
}

@end