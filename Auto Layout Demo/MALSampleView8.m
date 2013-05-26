//
//  MALSampleView8.m
//  Auto Layout Demo
//
//  Created by Robert Vojta on 25.05.13.
//  Copyright (c) 2013 Tapmates, Inc. All rights reserved.
//

#import "MALSampleView8.h"
#import "MALView.h"

@interface MALSampleView8()

@property (nonatomic,strong) UIBarButtonItem *biggerButton;
@property (nonatomic,strong) UIBarButtonItem *smallerButton;
@property (nonatomic,strong) MALView *view;

@end

@implementation MALSampleView8

#pragma mark - Lifecycle

- (id)initWithFrame:(CGRect)frame {
  self = [super initWithFrame:CGRectZero];
  if ( !self ) {
    return nil;
  }

  _view = [[MALView alloc] initWithFrame:CGRectZero];
  _view.forcedIntrinsicContentSize = (CGSize){200,200};
  _view.backgroundColor = [UIColor greenColor];
  _view.title = @"iCS 200x200";
  [self addSubview:_view];
  
  TMALVariableBindingsAMNO( _view );

  // horizontalne je zleva 10px - potom _view - a zprava to muze cokoli, ale minimalne 10px vuci superview (|)
  TMAL_ADDS_VISUAL( @"H:|-10-[_view]-(>=10)-|" );
  // to same, ale vertikalne
  TMAL_ADDS_VISUAL( @"V:|-10-[_view]-(>=10)-|" );
  
  _biggerButton = [[UIBarButtonItem alloc] initWithTitle:@"Bigger"
                                                   style:UIBarButtonItemStyleBordered
                                                  target:self
                                                  action:@selector(makeBigger:)];
  _smallerButton = [[UIBarButtonItem alloc] initWithTitle:@"Smaller"
                                                    style:UIBarButtonItemStyleBordered
                                                   target:self
                                                   action:@selector(makeSmaller:)];
  
  
  return self;
}

- (NSArray *)customButtonItems {
  return @[ self.biggerButton, self.smallerButton ];
}

- (void)makeBigger:(id)sender {
  CGSize size = self.view.forcedIntrinsicContentSize;
  self.view.forcedIntrinsicContentSize = (CGSize){2*size.width,2*size.height};
}

- (void)makeSmaller:(id)sender {
  CGSize size = self.view.forcedIntrinsicContentSize;
  self.view.forcedIntrinsicContentSize = (CGSize){0.5*size.width,0.5*size.height};
}

#pragma mark - Class

+ (NSString *)sampleName {
  return @"8 - intrinsic";
}

@end
