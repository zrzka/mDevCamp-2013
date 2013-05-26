//
//  MALSampleView2.m
//  Auto Layout Demo
//
//  Created by Robert Vojta on 24.05.13.
//  Copyright (c) 2013 Tapmates, Inc. All rights reserved.
//

#import "MALSampleView2.h"
#import "MALView.h"

@implementation MALSampleView2

#pragma mark - Lifecycle

- (id)initWithFrame:(CGRect)frame {
  self = [super initWithFrame:frame];
  if ( !self ) {
    return nil;
  }
  
  MALView *left = [[MALView alloc] initWithFrame:CGRectZero];
  left.backgroundColor = [UIColor greenColor];
  left.borderColor = [UIColor blackColor];
  left.title = @"Left";
  [self addSubview:left];
  
  MALView *right = [[MALView alloc] initWithFrame:CGRectZero];
  right.backgroundColor = [UIColor redColor];
  right.borderColor = [UIColor blackColor];
  right.title = @"Right";
  [self addSubview:right];
  
  TMALVariableBindingsAMNO( left, right );
  // 20px zleva vuci superview (|), 20px mezi left/right, 20px zprava vuci superview (|)
  TMAL_ADDS_VISUAL( @"H:|-20-[left]-20-[right]-20-|" );
  // 20px vrsek vuci superview (|), 20px spodek vuci superview (|)
  TMAL_ADDS_VISUAL( @"V:|-20-[left]-20-|" );
  // 20px vrsek vuci superview (|), 20px spodek vuci superview (|)
  TMAL_ADDS_VISUAL( @"V:|-20-[right]-20-|" );
  // left a right maji stejnou sirku
  TMAL_ADDS_ATTR( left, right, NSLayoutAttributeWidth, NSLayoutRelationEqual );
  
  return self;
}

#pragma mark - Class

+ (NSString *)sampleName {
  return @"2 - Two views";
}

@end
