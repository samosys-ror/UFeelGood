//
//  SlideViewController.h
//  Minifm
//
//  Created by Samosys on 07/09/15.
//  Copyright (c) 2015 Samosys. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SlideViewController : UIViewController<UITableViewDataSource,UITableViewDelegate>
{
    
     NSMutableArray *images;
}
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@end
