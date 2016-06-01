//
//  AppDelegate.m
//  U Feel Good
//
//  Created by samosys on 30/05/16.
//  Copyright © 2016 samosys. All rights reserved.
//

#import "AppDelegate.h"

@interface AppDelegate ()

@end

@implementation AppDelegate

@synthesize lastLocation,reach,netStatus,locationMgr,iOSDeviceToken,animatedImages,storyboardType;


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    [[FBSDKApplicationDelegate sharedInstance] application:application
                             didFinishLaunchingWithOptions:launchOptions];
    
    if(UI_USER_INTERFACE_IDIOM()==UIUserInterfaceIdiomPad)
    {
        storyboardType = [UIStoryboard storyboardWithName:@"ipad" bundle:nil];
    }
    else if(UI_USER_INTERFACE_IDIOM()==UIUserInterfaceIdiomPhone)
    {
        storyboardType = [UIStoryboard storyboardWithName:@"Iphone" bundle:nil];
    }
    
    UIViewController *viewController = [storyboardType instantiateViewControllerWithIdentifier:@"ViewController"]; //or the homeController
    UINavigationController *navController = [[UINavigationController alloc]initWithRootViewController:viewController];
    navController.navigationBarHidden = YES;
    
    self.window.rootViewController = navController;
    [self.window makeKeyAndVisible];
    
    
    self.img = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0,[[UIScreen mainScreen]bounds].size.width, [[UIScreen mainScreen]bounds].size.height)];
    self.img.image = [UIImage imageNamed:@"transprant_background.png"];
    [self.img setUserInteractionEnabled:YES];
    
    if ([[[UIDevice currentDevice]systemVersion]floatValue]>=8.0)
    {
        UIUserNotificationSettings *settings = [UIUserNotificationSettings settingsForTypes:(UIRemoteNotificationTypeBadge |UIRemoteNotificationTypeSound|UIRemoteNotificationTypeAlert) categories:nil];
        [[UIApplication sharedApplication] registerUserNotificationSettings:settings];
    }
    else
    {
        [[UIApplication sharedApplication] registerForRemoteNotificationTypes:UIRemoteNotificationTypeAlert|UIRemoteNotificationTypeBadge|UIRemoteNotificationTypeSound];
    }
    
    self.locationMgr = [[CLLocationManager alloc] init];
    self.locationMgr.delegate = self;
    
    self.locationMgr.desiredAccuracy = kCLLocationAccuracyBest; // 100 m
    if([[[UIDevice currentDevice] systemVersion] floatValue]>=8.0)
    {
        [self.locationMgr requestAlwaysAuthorization];
    }
    
    [self.locationMgr startUpdatingLocation];
    NSLog(@"Git called mathode");
     NSLog(@"Gaurang");
    return YES;
}


- (BOOL)application:(UIApplication *)application
            openURL:(NSURL *)url
  sourceApplication:(NSString *)sourceApplication
         annotation:(id)annotation {
    return [[FBSDKApplicationDelegate sharedInstance] application:application
                                                          openURL:url
                                                sourceApplication:sourceApplication
                                                       annotation:annotation];
}

- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    [FBSDKAppEvents activateApp];
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

- (void)application:(UIApplication *)app didRegisterForRemoteNotificationsWithDeviceToken:(NSData *)deviceToken
{
    self.iOSDeviceToken = [[deviceToken description] stringByTrimmingCharactersInSet: [NSCharacterSet characterSetWithCharactersInString:@"<>"]];
    self.iOSDeviceToken = [iOSDeviceToken stringByReplacingOccurrencesOfString:@" " withString:@""];
    
    // UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@"" message:self.iOSDeviceToken delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
    //  [alert show];
    
    Reachability *networkReachability = [Reachability reachabilityForInternetConnection];
    NetworkStatus networkStatus = [networkReachability currentReachabilityStatus];
    
    if (networkStatus == NotReachable)
    {
    }
    else
    {
        NSLog(@"There IS internet connection");
    }
    // [[[UIAlertView alloc]initWithTitle:nil message:self.iOSDeviceToken delegate:nil cancelButtonTitle:@"Ok" otherButtonTitles:nil, nil]show];
}

- (void)application:(UIApplication *)application didReceiveRemoteNotification:(NSDictionary *)userInfo
{
    [self remoteNotificationReceived:userInfo showAlert:YES];
}

-(void)application:(UIApplication *)application didFailToRegisterForRemoteNotificationsWithError:(NSError *)error
{
    //  [[[UIAlertView alloc]initWithTitle:@"" message:@"Failed To Register For Remote Notification" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil, nil]show];
}

- (void)remoteNotificationReceived:(NSDictionary *)userInfo showAlert:(BOOL)showAlert
{
    NSString *message = nil;
    id aps = [userInfo objectForKey:@"aps"];
    id alert = [aps objectForKey:@"alert"];
    
    if ([alert isKindOfClass:[NSString class]])
        message = alert;
    else if([alert isKindOfClass:[NSDictionary class]])
        message = [alert objectForKey:@"body"];
    
    NSString *acme = [userInfo objectForKey:@"acme"];
    if (acme)
        self.lauchOption = acme;
    
    if (alert){
        UIAlertView *alertView =[[UIAlertView alloc] initWithTitle:nil message:[aps objectForKey:@"alert"] delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil,nil];
        //alertView.delegate = self;
        [alertView show];
    }
}

- (void)application:(UIApplication *)application didRegisterUserNotificationSettings:(UIUserNotificationSettings *)notificationSettings
{
    [application registerForRemoteNotifications];
}

- (void)application:(UIApplication *)application handleActionWithIdentifier:(NSString *)identifier forRemoteNotification:(NSDictionary *)userInfo completionHandler:(void(^)())completionHandler
{
    if ([identifier isEqualToString:@"declineAction"])
    {
    }
    else if ([identifier isEqualToString:@"answerAction"])
    {
    }
}

-(void)locationManager:(CLLocationManager *)manager didFailWithError:(NSError *)error
{
    if([CLLocationManager locationServicesEnabled]){
        NSLog(@"Location Services Enabled");
        if([CLLocationManager authorizationStatus]==kCLAuthorizationStatusDenied){
        }
    }
}

- (void)locationManager:(CLLocationManager *)manager didUpdateToLocation:(CLLocation *)newLocation fromLocation:(CLLocation *)oldLocation
{
    if (!self.lastLocation) {
        self.lastLocation = newLocation;
    }
}

-(void)showLoader
{
    [[[UIApplication sharedApplication]keyWindow] addSubview:self.img];
    // Array to hold jpg images
    NSMutableArray *imageArray = [[NSMutableArray alloc] initWithCapacity:12];
    
    // Build array of images, cycling through image names
    for (int i = 1; i <= 12; i++)
        [imageArray addObject:[UIImage imageNamed:
                               [NSString stringWithFormat:@"loader-%d.png", i]]];
    
    // Animated images - centered on screen
    animatedImages = [[UIImageView alloc]
                      initWithFrame:CGRectMake(
                                               ([[UIScreen mainScreen]bounds].size.width / 2) - (IMAGE_WIDTH / 2),
                                               ([[UIScreen mainScreen]bounds].size.height / 2) - (IMAGE_HEIGHT / 2) + 35,
                                               IMAGE_WIDTH, IMAGE_HEIGHT)];
    animatedImages.animationImages = [NSArray arrayWithArray:imageArray];
    
    // One cycle through all the images takes 1 seconds
    animatedImages.animationDuration = 1.0;
    
    // Repeat forever
    animatedImages.animationRepeatCount = 0;
    
    // Add subview and make window visible
    [[[UIApplication sharedApplication]keyWindow] addSubview:animatedImages];
    [[[UIApplication sharedApplication]keyWindow]bringSubviewToFront:animatedImages];
    
    // Start it up
    animatedImages.startAnimating;
}

-(void)hideLoader
{
    [self.img removeFromSuperview];
    [animatedImages stopAnimating];
}


@end
