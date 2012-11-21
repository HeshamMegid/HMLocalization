//
//  AppDelegate.m
//  LocalizationDemo
//
//  Created by Hesham Abd-Elmegid on 21/11/12.
//  Copyright (c) 2012 Hesham Abd-Elmegid. All rights reserved.
//

#import "AppDelegate.h"
#import "ViewController.h"
#import "HMLocalization.h"

@interface AppDelegate ()
- (void)initRootViewController;
@end

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    HMLocalization *localization = [HMLocalization sharedInstance];
    [localization setLanguage:@"EN"];
    [self initRootViewController];
    return YES;
}

- (void)switchLanguage {
    [self.window removeFromSuperview];
    [self initRootViewController];
}

- (void)initRootViewController {
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    
    self.viewController = [[ViewController alloc] initWithNibName:@"ViewController" bundle:nil];
    self.window.rootViewController = self.viewController;
    [self.window makeKeyAndVisible];   
}

@end
