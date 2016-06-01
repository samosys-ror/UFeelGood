//
//  ViewController.m
//  U Feel Good
//
//  Created by samosys on 30/05/16.
//  Copyright © 2016 samosys. All rights reserved.
//

#import "ViewController.h"
#import "AppDelegate.h"
#import "Webservice.h"

@interface ViewController ()
{
    AppDelegate *app;
    Webservice *web;
}

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    app = (AppDelegate *)[[UIApplication sharedApplication] delegate];
    self.txt_userName.attributedPlaceholder = [[NSAttributedString alloc] initWithString:@"Username" attributes:@{NSForegroundColorAttributeName:[UIColor whiteColor]}];
    self.txt_password.attributedPlaceholder = [[NSAttributedString alloc] initWithString:@"Password" attributes:@{NSForegroundColorAttributeName:[UIColor whiteColor]}];
    
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)facebookLogin:(id)sender {
    
    FBSDKLoginManager *login = [[FBSDKLoginManager alloc] init];
    [login logInWithReadPermissions: @[@"public_profile",@"email",@"user_friends",@"user_birthday",@"user_hometown"] fromViewController:self
                            handler:^(FBSDKLoginManagerLoginResult *result, NSError *error)
     {
         if (error) {
             NSLog(@"Process error");
         } else if (result.isCancelled) {
             NSLog(@"Cancelled");
         } else
         {
             NSLog(@"Logged in");
             NSString *graphPath = @"me?fields=id,first_name,middle_name,last_name,birthday,name,hometown,link,email";
             FBSDKGraphRequest *request = [[FBSDKGraphRequest alloc] initWithGraphPath:graphPath parameters:nil];
             [request startWithCompletionHandler:^(FBSDKGraphRequestConnection *connection, id result, NSError *error)
              {
                  NSLog(@"%@ Hello",result);
                  if (!error)
                  {
                      //                      NSUserDefaults *defualt =[NSUserDefaults standardUserDefaults];
                      //                      [defualt setValue:[result valueForKey:@"first_name"] forKey:@"first_name"];
                      //                      [defualt setValue:[result valueForKey:@"last_name"] forKey:@"last_name"];
                      //                      [defualt setValue:@"" forKey:@"Pass"];
                      //                      [defualt setValue:@"" forKey:@"about_you"];
                      //                      [defualt setValue:[result valueForKey:@"date_of_birth"] forKey:@"date_of_birth"];
                      //                      [defualt setValue:@"" forKey:@"education"];
                      //                      [defualt setValue:@"" forKey:@"home_town"];
                      //                      [defualt setValue:@"" forKey:@"residence"];
                      //                      [defualt setValue:@"" forKey:@"occupation"];
                      //                      [defualt setValue:[NSString stringWithFormat:@"https://graph.facebook.com/%@/picture?type=large", [result valueForKey:@"id"]] forKey:@"image"];
                      //                      UIAlertView * alert = [[UIAlertView alloc] initWithTitle:@"" message:@"Login Successfully" delegate:nil cancelButtonTitle:@"Ok" otherButtonTitles:nil];
                      //                      [alert show];
//                      NSURL *url=[[NSURL alloc]initWithString:[[NSString stringWithFormat:@"%@facebook_login&email=%@&username=%@&token=%@&device_token%@&latitude=%@&longitude=%@",app.Weburl,[result valueForKey:@"email"],[result valueForKey:@"name"],app.iOSDeviceToken,app.uniqeID,[NSString stringWithFormat:@"%f", app.lastLocation.coordinate.latitude ],[NSString stringWithFormat:@"%f",app.lastLocation.coordinate.longitude]] stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding]];
//                      NSData *data=[NSData dataWithContentsOfURL:url];
//                      NSDictionary *dict=[NSJSONSerialization JSONObjectWithData:data options:kNilOptions error:nil];
//                      dict = [dict valueForKey:@"response"];
//                      if ([[dict valueForKey:@"sucess"]intValue]==1)
//                      {
//                          NSUserDefaults *loginUser=[NSUserDefaults standardUserDefaults];
//                          [loginUser setValue:[dict valueForKey:@"userid"] forKey:@"userid"];
//                          [loginUser setValue:[dict valueForKey:@"username"] forKey:@"username"];
//                          [loginUser setValue:[dict valueForKey:@"email"] forKey:@"email"];
//                          [loginUser setValue:[dict valueForKey:@"image"] forKey:@"image"];
//                          [loginUser setValue:[dict valueForKey:@"location"] forKey:@"location"];
//                          [loginUser setValue:[dict valueForKey:@"latitude"] forKey:@"latitude"];
//                          [loginUser setValue:[dict valueForKey:@"longitude"] forKey:@"longitude"];
//                          
//                          
//                          //                          [[[UIAlertView alloc]initWithTitle:@"" message:[NSString stringWithFormat:@"%@",[dict valueForKey:@"msg"]] delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil]show];
////                          self.txt_email.text = @"";
////                          self.txt_password.text = @"";
////                          
////                          self.navigationController.navigationBar.hidden=YES;
////                          SlideViewController *svc;
////                          HomeViewController *plvc;
////                          UIStoryboard * storyBoardWithoutAuto =[UIStoryboard storyboardWithName:@"Main" bundle:nil];
////                          svc=[[SlideViewController alloc]initWithNibName:@"SlideViewController" bundle:nil];
////                          plvc=[storyBoardWithoutAuto instantiateViewControllerWithIdentifier:@"HomeViewController"];;
////                          
////                          UINavigationController *nax2=[[UINavigationController alloc]initWithRootViewController:plvc];
////                          UINavigationController *nav1=[[UINavigationController alloc]initWithRootViewController:svc];
////                          NVSlideMenuController *slideMenuVC = [[NVSlideMenuController alloc] initWithMenuViewController:nav1 andContentViewController:nax2];
////                          self.navigationController.interactivePopGestureRecognizer.enabled = NO;
////                          [self.navigationController pushViewController:slideMenuVC animated:YES];
//                      }
                  }
              }];
         }
     }];
}

- (IBAction)twitterLogin:(id)sender {
}

- (IBAction)normalLogin:(id)sender
{
    self.scroll_View.contentSize=CGSizeMake(self.view.frame.size.width,self.view.frame.size.height);
    [self.scroll_View setContentOffset:CGPointMake(0,0)animated:YES];
    self.scroll_View.scrollEnabled = NO;
    [self.txt_userName resignFirstResponder];
    [self.txt_password resignFirstResponder];
    
    self.txt_userName.text = @"irshad";
    self.txt_password.text = @"123456";
    
    if (self.txt_userName.text.length!=0 && self.txt_password.text.length!=0)
    {
        web=[[Webservice alloc]init];
        [web Login:@selector(LoginResult:) tempTarget:self :self.txt_userName.text:self.txt_password.text];
    }
    else
    {
        [self AlertView:@"Please enter both username and password"];
    }
    
}

- (IBAction)forgotPassword:(id)sender {
}

- (IBAction)signUp:(id)sender
{
    SignUpViewController *signup = [app.storyboardType instantiateViewControllerWithIdentifier:@"SignUpViewController"];
    [self.navigationController pushViewController:signup animated:YES];
}

-(void)LoginResult:(NSDictionary*)dict_Response
{
    if (dict_Response==NULL)
    {
    }
    else
    {
        if([[dict_Response valueForKey:@"success"] intValue] == 1)
        {
            SlideViewController *svc;
            HomeViewController *plvc;
            svc=[[SlideViewController alloc]initWithNibName:@"SlideViewController" bundle:nil];
            plvc=[app.storyboardType instantiateViewControllerWithIdentifier:@"HomeViewController"];;
            
            UINavigationController *nax2=[[UINavigationController alloc]initWithRootViewController:plvc];
            UINavigationController *nav1=[[UINavigationController alloc]initWithRootViewController:svc];
            NVSlideMenuController *slideMenuVC = [[NVSlideMenuController alloc] initWithMenuViewController:nav1 andContentViewController:nax2];
            self.navigationController.interactivePopGestureRecognizer.enabled = NO;
            [self.navigationController pushViewController:slideMenuVC animated:YES];
        }
        else
        {
            [self AlertView:[dict_Response valueForKey:@"msg"]];
        }
    }
}

-(void)AlertView:(NSString *)msg
{
    UIAlertController * alert=   [UIAlertController alertControllerWithTitle:nil message:msg preferredStyle:UIAlertControllerStyleAlert];
    
    UIAlertAction* ok = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault handler:^(UIAlertAction * action){
                             [alert dismissViewControllerAnimated:YES completion:nil];
                         }];
    
    [alert addAction:ok];
    [self presentViewController:alert animated:YES completion:nil];
}

#pragma mark-TextField Delegate Methods
-(void)textFieldDidBeginEditing:(UITextField *)textField
{
    self.scroll_View.contentSize=CGSizeMake(self.view.frame.size.width,self.view.frame.size.height+250);
    self.scroll_View.scrollEnabled = YES;
    
    if (textField == self.txt_userName)
    {
        [self.scroll_View setContentOffset:CGPointMake(0,100)animated:YES];
    }
    else if (textField == self.txt_password)
    {
        [self.scroll_View setContentOffset:CGPointMake(0,150)animated:YES];
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
