//
//  SignUpViewController.m
//  U Feel Good
//
//  Created by samosys on 31/05/16.
//  Copyright © 2016 samosys. All rights reserved.
//

#import "SignUpViewController.h"

@interface SignUpViewController ()

@end

@implementation SignUpViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.txt_userName.attributedPlaceholder = [[NSAttributedString alloc] initWithString:@"Username" attributes:@{NSForegroundColorAttributeName:[UIColor whiteColor]}];
    self.txt_email.attributedPlaceholder = [[NSAttributedString alloc] initWithString:@"Email" attributes:@{NSForegroundColorAttributeName:[UIColor whiteColor]}];
    self.txt_password.attributedPlaceholder = [[NSAttributedString alloc] initWithString:@"Password" attributes:@{NSForegroundColorAttributeName:[UIColor whiteColor]}];
    self.txt_confirmPassword.attributedPlaceholder = [[NSAttributedString alloc] initWithString:@"Confirm Password" attributes:@{NSForegroundColorAttributeName:[UIColor whiteColor]}];
    self.txt_location.attributedPlaceholder = [[NSAttributedString alloc] initWithString:@"Location" attributes:@{NSForegroundColorAttributeName:[UIColor whiteColor]}];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (IBAction)addImage:(id)sender {
}

- (IBAction)signUp:(id)sender
{
    self.scroll_View.contentSize=CGSizeMake(self.view.frame.size.width,self.view.frame.size.height);
    [self.scroll_View setContentOffset:CGPointMake(0,0)animated:YES];
    self.scroll_View.scrollEnabled = NO;
    [self.txt_userName resignFirstResponder];
    [self.txt_email resignFirstResponder];
    [self.txt_password resignFirstResponder];
    [self.txt_confirmPassword resignFirstResponder];
    [self.txt_location resignFirstResponder];
}

#pragma mark-TextField Delegate Methods
-(void)textFieldDidBeginEditing:(UITextField *)textField
{
    self.scroll_View.contentSize=CGSizeMake(self.view.frame.size.width,self.view.frame.size.height+250);
    self.scroll_View.scrollEnabled = YES;
    
    if (textField == self.txt_password)
    {
        [self.scroll_View setContentOffset:CGPointMake(0,100)animated:YES];
    }
    else if (textField == self.txt_confirmPassword)
    {
        [self.scroll_View setContentOffset:CGPointMake(0,150)animated:YES];
    }
    else if (textField == self.txt_location)
    {
        [self.scroll_View setContentOffset:CGPointMake(0,200)animated:YES];
    }
    else
    {
        [self.scroll_View setContentOffset:CGPointMake(0,0)animated:YES];
    }
}

-(BOOL)textFieldShouldReturn:(UITextField *)textField
{
    self.scroll_View.contentSize=CGSizeMake(self.view.frame.size.width,self.view.frame.size.height);
    [self.scroll_View setContentOffset:CGPointMake(0,0)animated:YES];
    [textField resignFirstResponder];
    self.scroll_View.scrollEnabled = NO;
    return YES;
}

//Hide Keyboard//
-(BOOL)textFieldShouldBeginEditing:(UITextField *)textField
{
    return YES;
}

@end
