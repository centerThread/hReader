//
//  HRPasscodeWarningViewController.h
//  HReader
//
//  Created by Marshall Huss on 12/16/11.
//  Copyright (c) 2011 MITRE Corporation. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface HRPasscodeWarningViewController : UIViewController

@property (retain, nonatomic) IBOutlet UIImageView *imageView;
@property (retain, nonatomic) IBOutlet UIButton *confirmButton;

@property (nonatomic) BOOL demoMode;

- (IBAction)confirmButtonPressed:(id)sender;

@end
