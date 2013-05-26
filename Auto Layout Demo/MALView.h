//
//  MALView.h
//  Auto Layout Demo
//
//  Created by Robert Vojta on 24.05.13.
//  Copyright (c) 2013 Tapmates, Inc. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MALView : UIView

@property (nonatomic,copy) UIColor *borderColor;
@property (nonatomic,copy) NSString *title;

@property (nonatomic,assign) CGSize forcedFittingSize;
@property (nonatomic,assign) CGSize forcedIntrinsicContentSize;

@end
