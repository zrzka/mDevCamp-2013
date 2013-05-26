//
//  MALSampleView1.m
//  Auto Layout Demo
//
//  Created by Robert Vojta on 24.05.13.
//  Copyright (c) 2013 Tapmates, Inc. All rights reserved.
//

#import "MALSampleView1.h"
#import "MALView.h"

@implementation MALSampleView1

#pragma mark - Lifecycle

- (id)initWithFrame:(CGRect)frame {
  self = [super initWithFrame:CGRectZero];
  if ( !self ) {
    return nil;
  }
  
  MALView *view = [[MALView alloc] initWithFrame:CGRectZero];
  view.title = @"20px padding";
  [self addSubview:view];

  TMALVariableBindingsAMNO( view );
  TMAL_ADDS_VISUAL( @"H:|-20-[view]-20-|" ); // 20px zleva vuci superview (|) a 20px zprava vuci superview (|)
  TMAL_ADDS_VISUAL( @"V:|-20-[view]-20-|" ); // 20px vrsek vuci superview (|) a 20px spodek vuci superview (|)
  
  return self;
}

#pragma mark - Class

+ (NSString *)sampleName {
  return @"1 - One view";
}

@end
