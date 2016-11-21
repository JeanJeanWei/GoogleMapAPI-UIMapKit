//
//  GeoManager.m
//  CodingExercise1
//
//  Created by JJ WEI on 12-08-06.
//  Copyright (c) 2012 Ice Whale Inc. All rights reserved.
//

#import "GeoManager.h"
#import "SBJSON.h"

@implementation GeoManager

+ (GeoManager*)instance
{
    static GeoManager* instance = nil;
    
    if (!instance)
    {
        instance = [GeoManager new];
    }
    
    return instance;
}

-(void)geoLocationForAddress:(NSString*)address delegate:(id<GeoManagerDelegate>)delegate
{
    dispatch_queue_t queue = dispatch_queue_create("icewhale.com", NULL);
    
    dispatch_async(queue, ^{
        
        NSMutableDictionary* parameters = [NSMutableDictionary dictionary];
        
        NSString *a = [address stringByReplacingOccurrencesOfString:@" " withString:@"+"];
        [parameters setObject:a forKey:@"address"];
        [parameters setObject:@"true" forKey:@"sensor"];
        
        
        NSString* parameterList = [GeoManager parameterStringForDictionary:parameters];
        
        NSString* urlString = [NSString stringWithFormat:@"%@%@", @"http://maps.googleapis.com/maps/api/geocode/json?", parameterList];
        NSLog(@"urlString = %@",urlString);
        NSURL* url = [NSURL URLWithString:urlString];
        
        NSMutableURLRequest* request = [NSMutableURLRequest requestWithURL:url];
        NSLog(@"%@",request);
        NSError* error = nil;
        NSURLResponse* response = nil;
        
        NSData* data = [NSURLConnection sendSynchronousRequest:request returningResponse:&response error:&error];
        
        NSHTTPURLResponse* httpResponse = (NSHTTPURLResponse*)response;
        
        dispatch_async(dispatch_get_main_queue(), ^{
            
            NSError* apiError = error;
            NSArray* deals = nil;
            
            if (!apiError)
            {
                if (httpResponse.statusCode != 200)
                {
                    NSString* errorMessage = [NSHTTPURLResponse localizedStringForStatusCode:httpResponse.statusCode];
                    
                    NSDictionary* errorInfo = [NSDictionary dictionaryWithObject:errorMessage forKey:NSLocalizedDescriptionKey];
                    
                    apiError = [NSError errorWithDomain:@"E_HTTP" code:httpResponse.statusCode userInfo:errorInfo];
                }
                else
                {
                    NSString* response = [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
                    
                    NSDictionary* responseDict = [response JSONValue];
                    
                    if ([responseDict isKindOfClass:[NSDictionary class]])
                    {
                        // todo - parse error meta from response
                        
                        deals = [responseDict objectForKey:@"results"];
                    }
                }
            }
            
            if (!apiError && !deals)
            {
                apiError = [NSError errorWithDomain:@"E_UNKNOWN" code:1 userInfo:nil];
            }
            
            if (apiError)
            {
                [delegate geoManager:self didFailWithError:error];
            }
            else
            {
                [delegate geoManager:self didFindDeals:deals];
            }
        });
    });
    
    dispatch_release(queue);
}

+ (NSString*)parameterStringForDictionary:(NSDictionary*)parameters
{
    NSMutableString* parameterList = [NSMutableString string];
    
    for (NSString* key in parameters)
    {
        NSString* value = [parameters objectForKey:key];
        
        if ([parameterList length] > 0)
        {
            [parameterList appendString:@"&"];
        }
        
        [parameterList appendString:key];
        [parameterList appendString:@"="];
        
        NSString* encodedValue = [value stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
        
        [parameterList appendString:encodedValue];
    }
    
    return parameterList;
}
@end
