//
//  MALDetailViewController.h
//  Auto Layout Demo
//
//  Created by Robert Vojta on 24.05.13.
//  Copyright (c) 2013 Tapmates, Inc. All rights reserved.
//

#import <UIKit/UIKit.h>

@class MALSampleView;

@interface MALDetailViewController : UIViewController <UISplitViewControllerDelegate>

@property (nonatomic,strong) MALSampleView *sampleView;

@end
