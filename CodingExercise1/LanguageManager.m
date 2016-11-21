//
//  LanguageManager.m
//  CodingExercise1
//
//  Created by JJ WEI on 12-08-06.
//  Copyright (c) 2012 Ice Whale Inc. All rights reserved.
//

#import "LanguageManager.h"

@implementation LanguageManager

+ (NSString*)applicationName
{
    NSDictionary* dictionary = NSBundle.mainBundle.localizedInfoDictionary;
    
    if (!dictionary)
    {  
        dictionary = NSBundle.mainBundle.infoDictionary;
    }
    
    return [dictionary objectForKey:@"CFBundleDisplayName"];
}

+ (NSString*)stringForString:(NSString*)string
{
    return NSLocalizedString(string, string);
}

+ (NSString*)stringForKey:(NSString*)key
{
    return [LanguageManager stringForString:key];
}

@end
