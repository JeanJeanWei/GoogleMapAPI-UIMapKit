//
//  AddressManager.m
//  CodingExercise1
//
//  Created by JJ WEI on 12-08-06.
//  Copyright (c) 2012 Ice Whale Inc. All rights reserved.
//

#import "AddressManager.h"

@implementation AddressManager 
@synthesize data;

+ (AddressManager*)instance
{
    static AddressManager* instance = nil;
    
    if (!instance)
    {
        instance = [AddressManager new];
    }
    
    return instance;
}

- (void)startNewProgress
{
    data = [SampleModel new];
    
    
    [self saveDataToDisk];
}

- (void)manageProgress
{
    if ([AddressManager.instance shouldStartNewProgress])
    {
        data = [SampleModel new];
        tempAddress = [AddressModel new];
        
        // sample data
        tempAddress.address = @"33 Bay St, Toronto, ON";
        tempAddress.description = @"sample";
        
        [GeoManager.instance geoLocationForAddress:tempAddress.address delegate:self];
        [self saveDataToDisk];
    }
    else 
    {
        [self loadDataFromDisk];
    }
}

- (BOOL)shouldStartNewProgress
{
    BOOL startNew = NO;
    
    NSString *hasProgress = [[NSUserDefaults standardUserDefaults] objectForKey:@"hasProgress"];
    if (!hasProgress) 
    {
        startNew = YES;
        [[NSUserDefaults standardUserDefaults] setObject:@"YES" forKey:@"hasProgress"];
    }
    return startNew;
}

- (NSString*)pathForDataFile:(NSString*)filename
{
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *documentsDirectory = [paths objectAtIndex:0];
    NSString *filePath = [documentsDirectory stringByAppendingPathComponent:filename];
    return filePath;
}

- (void)saveDataToDisk
{
    NSString * path = [self pathForDataFile:@"data"];
    [NSKeyedArchiver archiveRootObject:data toFile: path];
   
     
     
     for (int i = 0; i<data.addressData.count; i++) 
     {
         AddressModel *t = [data.addressData objectAtIndex:i];
     NSLog(@"save: addressData -> address=%@, description=%@, lat=%f, lng=%f,", t.address,t .description, t.lat, t.lng);
     }
    
}

- (void)loadDataFromDisk
{
    NSString *path = [self pathForDataFile:@"data"];
    
    data =  [NSKeyedUnarchiver unarchiveObjectWithFile:path];
    
    for (int i = 0; i<data.addressData.count; i++) 
    {
        AddressModel *t = [data.addressData objectAtIndex:i];
        NSLog(@"load: addressData -> address=%@, description=%@, lat=%f, lng=%f,", t.address,t .description, t.lat, t.lng);
    } 
}
- (void)addAddress:(NSString*)a andDescription:(NSString*)d
{
    tempAddress = [AddressModel new];
    tempAddress.address = a;
    tempAddress.description = d;
    
    [GeoManager.instance geoLocationForAddress:a delegate:self];
}
- (void)deleteAddress:(int)idx
{
    [data.addressData removeObjectAtIndex:idx];
    [self saveDataToDisk];
}

#pragma mark GeoManager delegate
- (void)geoManager:(GeoManager*)geoManager didFailWithError:(NSError*)error
{
    UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:[LanguageManager stringForKey:@"Cannot convert the Address to GeoLocation."] message:@"" delegate:nil cancelButtonTitle:nil otherButtonTitles:[LanguageManager stringForKey:@"Dismiss"], nil];
    [alertView show];
}
- (void)geoManager:(GeoManager*)geolManager didFindDeals:(NSArray*)results
{
    NSDictionary *location = [[[results objectAtIndex:0 ] objectForKey:@"geometry"]  objectForKey:@"location"];
    tempAddress.lat = [[location objectForKey:@"lat"] floatValue];
    tempAddress.lng = [[location objectForKey:@"lng"] floatValue];
    [data.addressData addObject:tempAddress];
    [self saveDataToDisk];
    
    [[NSNotificationCenter defaultCenter]
     postNotificationName:@"addNewItem"
     object:nil ];
}
@end
