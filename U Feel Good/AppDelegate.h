//
//  AppDelegate.h
//  U Feel Good
//
//  Created by samosys on 30/05/16.
//  Copyright © 2016 samosys. All rights reserved.
//

#define IMAGE_WIDTH       43
#define IMAGE_HEIGHT      43


#import <UIKit/UIKit.h>
#import <FBSDKCoreKit/FBSDKCoreKit.h>
#import <CoreLocation/CoreLocation.h>
#import <MobileCoreServices/MobileCoreServices.h>
#import "Reachability.h"

@interface AppDelegate : UIResponder <UIApplicationDelegate,CLLocationManagerDelegate>

@property (strong, nonatomic) UIWindow *window;

@property (nonatomic,retain)NSString *iOSDeviceToken;
@property (nonatomic, retain) CLLocationManager *locationMgr;
@property (nonatomic, retain) CLLocation *lastLocation;
@property (strong, nonatomic) NSString* lauchOption;
@property UIImageView *img,*img1;
@property UIImageView  *animatedImages;
@property (strong,nonatomic)Reachability *reach;
@property(nonatomic)NetworkStatus netStatus;

@property UIStoryboard *storyboardType;

-(void)showLoader;
-(void)hideLoader;

@end

