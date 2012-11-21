//
//  ViewController.m
//  LocalizationDemo
//
//  Created by Hesham Abd-Elmegid on 21/11/12.
//  Copyright (c) 2012 Hesham Abd-Elmegid. All rights reserved.
//

#import "ViewController.h"
#import "HMLocalization.h"
#import "AppDelegate.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];

    HMLocalization *localization = [HMLocalization sharedInstance];

    [self.helloWorldLabel setText:[localization localizedStringForKey:@"Hello World"]];

    if ([localization languageDirection] == HMLanguageDirectionLeftToRight) {
        [self.helloWorldLabel setTextAlignment:NSTextAlignmentLeft];
    } else {
        [self.helloWorldLabel setTextAlignment:NSTextAlignmentRight];
    }
}

- (IBAction)switchLanguageButtonTapped:(id)sender {
    [[HMLocalization sharedInstance] setLanguage:@"FR"];
    [(AppDelegate *)[[UIApplication sharedApplication] delegate] switchLanguage];
}

@end
