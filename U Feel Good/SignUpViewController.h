//
//  SignUpViewController.h
//  U Feel Good
//
//  Created by samosys on 31/05/16.
//  Copyright © 2016 samosys. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SignUpViewController : UIViewController<UITextFieldDelegate>

@property (weak, nonatomic) IBOutlet UIScrollView *scroll_View;
@property (weak, nonatomic) IBOutlet UIImageView *img_user;
@property (weak, nonatomic) IBOutlet UITextField *txt_userName;
@property (weak, nonatomic) IBOutlet UITextField *txt_email;
@property (weak, nonatomic) IBOutlet UITextField *txt_password;
@property (weak, nonatomic) IBOutlet UITextField *txt_confirmPassword;
@property (weak, nonatomic) IBOutlet UITextField *txt_location;
- (IBAction)addImage:(id)sender;
- (IBAction)signUp:(id)sender;
@end
