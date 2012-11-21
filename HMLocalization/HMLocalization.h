//
//  HMLocalization.h
//  Conversable
//
//  Created by Hesham Abd-Elmegid on 10/9/12.
//  Copyright (c) 2012 Startappz. All rights reserved.
//

#import <Foundation/Foundation.h>

// Language direction can be set in the localization file by adding the optional key HMLanguageDirection and giving it a value of
// either "ltr" or "rtl"
enum HMLanguageDirection {
    HMLanguageDirectionLeftToRight = 1,
    HMLanguageDirectionRightToLeft = 2
};

@interface HMLocalization : NSObject {

}

// Return the shared instance of the framework that could be used anywhere in the app. setLanguage must be called
// the first time the shared instance is used to initialize it.
+ (id)sharedInstance;

// Initialize the framework with a certain language. Could also be used for changing language while the app is
// already running. languageName is the name of a text file in the app bundle.
- (void)setLanguage:(NSString *)languageName;

// Get the localized string for a key
- (NSString *)localizedStringForKey:(NSString *)key;

@property (nonatomic, strong) NSDictionary *localizedStrings;
@property (nonatomic, strong) NSString *activeLanguage;
@property (nonatomic) enum HMLanguageDirection languageDirection;

@end
