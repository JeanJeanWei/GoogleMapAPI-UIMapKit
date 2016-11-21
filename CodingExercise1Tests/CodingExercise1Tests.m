//
//  CodingExercise1Tests.m
//  CodingExercise1Tests
//
//  Created by JJ WEI on 12-08-06.
//  Copyright (c) 2012 Ice Whale Inc. All rights reserved.
//

#import "CodingExercise1Tests.h"
#import "SampleViewController.h"
#import "GeoManager.h"
#import "AddressManager.h"


//***************************************//
// test unit to test custemcell delegate //
//***************************************//
@interface TestCustomCellBehavior : SenTestCase <CustomCellDelegate>
{
    CustomCell *_object;
    BOOL _callbackInvoked;
}
@end

@implementation TestCustomCellBehavior

- (void)setUp 
{
    [super setUp];
    _object = [[CustomCell alloc] init];
    _object.delegate = self;
}

- (void)tearDown 
{
    _object.delegate = nil;
  
    [super tearDown];
}

- (void)testSomeBehaviorCallingBack {
    [_object deleteClicked];
    
    STAssertTrue(_callbackInvoked,
                 @"Delegate should send - customCell:CustomCellDeleteClicked: - delegateInvoked");
}
- (void)CustomCellDeleteClicked
{
    [self customCell:_object delegateInvoked:YES];
}
- (void)customCell:(CustomCell *)cell delegateInvoked:(BOOL)invoked {
    _callbackInvoked = YES;
}

@end

//***************************************//
// test unit to test GeoManagerDelegate  //
//***************************************//

@interface TestGeoManagerBehavior : SenTestCase <GeoManagerDelegate>
{
    AddressManager *_object;
    BOOL _callbackInvoked;
    BOOL _successed;
}
@end

@implementation TestGeoManagerBehavior

- (void)setUp 
{
    [super setUp];
    _object = [[AddressManager alloc] init];
   // _object.delegate = self;
}

- (void)tearDown 
{
   // _object.delegate = nil;
    
    [super tearDown];
}

- (void)testSomeBehaviorCallingBack {
    [GeoManager.instance geoLocationForAddress:@"1600 Amphitheatre Parkway, Mountain View, CA" delegate:self];
    if (_successed) 
    {
        STAssertTrue(_callbackInvoked,
                     @"Delegate should send - geoManager:didFindDeals: - delegateInvoked");
    }
    
}
- (void)geoManager:(GeoManager*)geoManager didFailWithError:(NSError*)error
{
    [self manager:_object delegateInvoked:YES Success:NO];
}
- (void)geoManager:(GeoManager*)geolManager didFindDeals:(NSArray*)results
{
     [self manager:_object delegateInvoked:YES Success:YES];
}

- (void)manager:(AddressManager *)manager delegateInvoked:(BOOL)invoked Success:(BOOL)success
{
    _callbackInvoked = YES;
    _successed = success;
}

@end


//***************************************//
// test unit to test General test        //
//***************************************//

@implementation CodingExercise1Tests

- (void)setUp
{
    [super setUp];
    
    // Set-up code here.
}

- (void)tearDown
{
    // Tear-down code here.
    
    [super tearDown];
}

- (void)testTestFramework
{
    NSString *string1 = @"test";
    NSString *string2 = @"test";
    STAssertEquals(string1, 
                   string2, 
                   @"FAILURE");
    NSUInteger uint_1 = 4;
    NSUInteger uint_2 = 4;
    STAssertEquals(uint_1, 
                   uint_2, 
                   @"FAILURE");
}
- (void) testAppDelegate {
    
    id applicationDelegate = [[UIApplication sharedApplication] delegate];
    STAssertNotNil(applicationDelegate, @"UIApplication failed to find the AppDelegate");
    
}
@end
