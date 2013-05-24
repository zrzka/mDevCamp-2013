//
//  MALMasterViewController.h
//  Auto Layout Demo
//
//  Created by Robert Vojta on 24.05.13.
//  Copyright (c) 2013 Tapmates, Inc. All rights reserved.
//

#import <UIKit/UIKit.h>

@class MALDetailViewController;

@interface MALMasterViewController : UITableViewController

@property (strong, nonatomic) MALDetailViewController *detailViewController;

@end
