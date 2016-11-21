//
//  LanguageManager.h
//  CodingExercise1
//
//  Created by JJ WEI on 12-08-06.
//  Copyright (c) 2012 Ice Whale Inc. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface LanguageManager : NSObject

+ (NSString*)applicationName;

// loads a localised string value for a given phrase
+ (NSString*)stringForString:(NSString*)string;

/* loads a localised string for a message key in the format MSG_****** from the
    strings localisation file
*/
+ (NSString*)stringForKey:(NSString*)key;

@end
