//
//  ViewController.h
//  U Feel Good
//
//  Created by samosys on 30/05/16.
//  Copyright © 2016 samosys. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <FBSDKCoreKit/FBSDKCoreKit.h>
#import <FBSDKLoginKit/FBSDKLoginKit.h>
#import "SignUpViewController.h"
#import "SlideViewController.h"
#import "HomeViewController.h"
#import "NVSlideMenuController.h"

@interface ViewController : UIViewController<UITextFieldDelegate>
@property (weak, nonatomic) IBOutlet UITextField *txt_userName;
@property (weak, nonatomic) IBOutlet UITextField *txt_password;
@property (weak, nonatomic) IBOutlet UIScrollView *scroll_View;

- (IBAction)facebookLogin:(id)sender;
- (IBAction)twitterLogin:(id)sender;
- (IBAction)normalLogin:(id)sender;
- (IBAction)forgotPassword:(id)sender;
- (IBAction)signUp:(id)sender;

@end

