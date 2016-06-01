//
//  SlideViewController.m
//  Minifm
//
//  Created by Samosys on 07/09/15.
//  Copyright (c) 2015 Samosys. All rights reserved.
//

#import "SlideViewController.h"
#import "NVSlideMenuController.h"
#import "HomeViewController.h"
#import "ViewController.h"

@interface SlideViewController ()
{
    NSArray *optionNameArr;
    BOOL inboxSelectedStatus;
}

@end

@implementation SlideViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    images=[[NSMutableArray alloc] initWithObjects:@"home_icon.png", @"message_icon.png", @"groups_icon.png", @"mobile_icon.png", @"lawn_service_icon.png", @"settings_icon.png", @"logout_icon.png", nil];
    
    optionNameArr = [[NSArray alloc] initWithObjects:@"Home",@"Inbox",@"Groups",@"Mobile Car Detail Service",@"Mobile Lawn Care Service",@" Settings",@"Logout", nil];
    inboxSelectedStatus = NO;
    
    
    UIImageView *tempImageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"menu_main_bg.png"]];
    [tempImageView setFrame:self.tableView.frame];
    
    self.tableView.backgroundView = tempImageView;
}

-(void)viewWillAppear:(BOOL)animated
{
    self.navigationController.navigationBar.hidden=YES;
    [self.tableView reloadData];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

#pragma mark Table View Delegates

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
   return images.count;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 50;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    tableView.separatorColor = [UIColor clearColor];
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"CELL"];
    if(cell == nil)
    {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:@"cell"];
    }
    
    cell.selectionStyle = UITableViewCellSelectionStyleNone;

    UIImageView *img1 = [[UIImageView alloc]initWithFrame:CGRectMake(10, 10, 30, 30)];
    img1.image=[UIImage imageNamed:[images objectAtIndex:indexPath.row]];
    [cell addSubview:img1];
    
    UILabel *optionName = [[UILabel alloc]initWithFrame:CGRectMake(50, 10, 180, 30)];
    optionName.font = [UIFont fontWithName:@"Helvetica-Bold" size:14];
    optionName.text = [optionNameArr objectAtIndex:indexPath.row];
    optionName.textColor = [UIColor whiteColor];
    [cell addSubview:optionName];
    
    UIImageView *tempImageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"menu_list_bg.png"]];
    [tempImageView setFrame:self.tableView.frame];
    cell.backgroundView = tempImageView;

    
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
//    if (indexPath.row==0)
//    {
//        ProfileViewController *pvc;
//        UIStoryboard * storyBoardWithoutAuto =[UIStoryboard storyboardWithName:@"Main" bundle:nil];
//        
//        pvc=[storyBoardWithoutAuto instantiateViewControllerWithIdentifier:@"ProfileViewController"];;
//        
//        UINavigationController *navController = [[UINavigationController alloc] initWithRootViewController:pvc];
//        
//        [self.slideMenuController closeMenuBehindContentViewController:navController animated:YES completion:nil];
//    }
    
//    if (indexPath.row==4)
//    {
//        YourFavouriteViewController *plvc;
//        UIStoryboard * storyBoardWithoutAuto =[UIStoryboard storyboardWithName:@"Main" bundle:nil];
//        plvc=[storyBoardWithoutAuto instantiateViewControllerWithIdentifier:@"YourFavouriteViewController"];
//        UINavigationController *navController = [[UINavigationController alloc] initWithRootViewController:plvc];
//        [self.slideMenuController closeMenuBehindContentViewController:navController animated:YES completion:nil];
//    }
//    if (indexPath.row==5)
//    {
//        SettingViewController *svc;
//        UIStoryboard * storyBoardWithoutAuto =[UIStoryboard storyboardWithName:@"Main" bundle:nil];
//        svc=[storyBoardWithoutAuto instantiateViewControllerWithIdentifier:@"SettingViewController"];
//        UINavigationController *navController = [[UINavigationController alloc] initWithRootViewController:svc];
//        [self.slideMenuController closeMenuBehindContentViewController:navController animated:YES completion:nil];
//        
////        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"" message:@"Under Working" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
////        [alert show];
//    }
//    if (indexPath.row==6)
//    {
//        CartViewController *plvc;
//        UIStoryboard * storyBoardWithoutAuto =[UIStoryboard storyboardWithName:@"Main" bundle:nil];
//        plvc=[storyBoardWithoutAuto instantiateViewControllerWithIdentifier:@"CartViewController"];;
//        UINavigationController *navController = [[UINavigationController alloc] initWithRootViewController:plvc];
//        [self.slideMenuController closeMenuBehindContentViewController:navController animated:YES completion:nil];
//    }

}

- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex
{
    if (buttonIndex == [alertView cancelButtonIndex])
    {
        if([[NSUserDefaults standardUserDefaults] boolForKey:@"reminderMeStatus"] == YES)
        {
            [[NSUserDefaults standardUserDefaults] removeObjectForKey:@"userid"];
            [[NSUserDefaults standardUserDefaults] removeObjectForKey:@"username"];
            [[NSUserDefaults standardUserDefaults] removeObjectForKey:@"email"];
            [[NSUserDefaults standardUserDefaults] removeObjectForKey:@"image"];
            [[NSUserDefaults standardUserDefaults] removeObjectForKey:@"location"];
            [[NSUserDefaults standardUserDefaults] removeObjectForKey:@"latitude"];
            [[NSUserDefaults standardUserDefaults] removeObjectForKey:@"longitude"];
        }
        else
        {
            NSString *appDomain = [[NSBundle mainBundle] bundleIdentifier];
            [[NSUserDefaults standardUserDefaults] removePersistentDomainForName:appDomain];
        }
        
        ViewController *svc;
        UIStoryboard * storyBoardWithoutAuto =[UIStoryboard storyboardWithName:@"Main" bundle:nil];
        svc=[storyBoardWithoutAuto instantiateViewControllerWithIdentifier:@"ViewController"];;
        UINavigationController *navController = [[UINavigationController alloc] initWithRootViewController:svc];
        [self.slideMenuController closeMenuBehindContentViewController:navController animated:YES completion:nil];
    }
}

@end
