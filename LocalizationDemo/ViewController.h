//
//  ViewController.h
//  LocalizationDemo
//
//  Created by Hesham Abd-Elmegid on 21/11/12.
//  Copyright (c) 2012 Hesham Abd-Elmegid. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController

- (IBAction)switchLanguageButtonTapped:(id)sender;

@property (weak, nonatomic) IBOutlet UILabel *helloWorldLabel;

@end
