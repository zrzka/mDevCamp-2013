//
//  MALSampleView.h
//  Auto Layout Demo
//
//  Created by Robert Vojta on 24.05.13.
//  Copyright (c) 2013 Tapmates, Inc. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MALSampleView : UIView

- (NSArray *)customButtonItems;
- (NSArray *)rightButtonItems;

- (void)didDisplaySampleView;
- (void)willRotateToInterfaceOrientation:(UIInterfaceOrientation)toInterfaceOrientation duration:(NSTimeInterval)duration;
- (void)didRotateFromInterfaceOrientation:(UIInterfaceOrientation)fromInterfaceOrientation;

+ (NSString *)sampleName;

@end
