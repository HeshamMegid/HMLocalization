//
//  HMLocalization.m
//  Conversable
//
//  Created by Hesham Abd-Elmegid on 10/9/12.
//  Copyright (c) 2012 Startappz. All rights reserved.
//

#import "HMLocalization.h"

#define HMLog(fmt, ...) NSLog((@"HMLocalization: " fmt), ##__VA_ARGS__);

@interface HMLocalization ()
- (enum HMLanguageDirection)languageDirection;
@end

@implementation HMLocalization
@synthesize localizedStrings;
@synthesize activeLanguage;

+ (id)sharedInstance {
    // Create a singleton instance of the class
    static HMLocalization *sharedInstance = nil;
    static dispatch_once_t onceToken;
    
    dispatch_once(&onceToken, ^{
        sharedInstance = [[self alloc] init];
    });
    
    return sharedInstance;
}

- (enum HMLanguageDirection)languageDirection {
    if (_languageDirection == 0)
        return HMLanguageDirectionLeftToRight;
    
    return _languageDirection;
}

- (void)setLanguage:(NSString *)languageName {
    self.activeLanguage = languageName;
    NSString *path = [[NSBundle mainBundle] pathForResource:[languageName uppercaseString]
                                                     ofType:@"txt"];
    NSString *content = [NSString stringWithContentsOfFile:path
                                                  encoding:NSUTF8StringEncoding
                                                     error:NULL];
    
    NSArray *keysAndValuesArray = [content componentsSeparatedByString:@"\n"];
    NSMutableDictionary *tempLocalizedstrings = [[NSMutableDictionary alloc] init];
    
    for (NSString *keyAndValue in keysAndValuesArray) {
        NSArray * separatedKeyAndValue = [keyAndValue componentsSeparatedByString:@"\""];
        
        @try {
            NSString *key = [separatedKeyAndValue objectAtIndex:1];
            NSString *value = [separatedKeyAndValue objectAtIndex:3];
            
            if ([key isEqualToString:@"HMLanguageDirection"]) {
                // If the key being processed is the language direction key (HMLanguageDirection), don't add it to
                // the localizedStringsDictionary and set the languageDirection ivar insteads.
                if ([value isEqualToString:@"ltr"])
                    self.languageDirection = HMLanguageDirectionLeftToRight;
                else
                    self.languageDirection = HMLanguageDirectionRightToLeft;
            } else {
                [tempLocalizedstrings setObject:value forKey:[key uppercaseString]];
            }
        }
        @catch (NSException *exception) {
            HMLog(@"Encountered incorrect format while reading %@ localization file: %@", languageName, exception.description);
        }
        
    }
    
    self.localizedStrings = [tempLocalizedstrings mutableCopy];
}

- (NSString *)localizedStringForKey:(NSString *)key {
    if (!self.activeLanguage) {
        HMLog(@"No language selected");
    }
    
    NSString *valueForKey = [self.localizedStrings objectForKey:[key uppercaseString]];
    
    if (valueForKey)
        return valueForKey;
    else
        return key;
}

@end
