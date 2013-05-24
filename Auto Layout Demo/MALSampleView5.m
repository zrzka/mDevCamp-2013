//
//  MALSampleView5.m
//  Auto Layout Demo
//
//  Created by Robert Vojta on 24.05.13.
//  Copyright (c) 2013 Tapmates, Inc. All rights reserved.
//

#import "MALSampleView5.h"
#import "MALView.h"

@interface MALSampleView5()

@property (nonatomic,strong) NSMutableArray *portraitConstraints;
@property (nonatomic,strong) NSMutableArray *landscapeConstraints;

@end

@implementation MALSampleView5

#pragma mark - Lifecycle

- (id)initWithFrame:(CGRect)frame {
  self = [super initWithFrame:frame];
  if ( !self ) {
    return nil;
  }
  
  MALView *one = [[MALView alloc] initWithFrame:CGRectZero];
  one.title = @"Portrait - top, Landscape - left";
  one.backgroundColor = [UIColor greenColor];
  [self addSubview:one];
  
  MALView *two = [[MALView alloc] initWithFrame:CGRectZero];
  two.title = @"Portrait - bottom, Landscape - right";
  two.backgroundColor = [UIColor yellowColor];
  [self addSubview:two];

  _portraitConstraints = [@[] mutableCopy];
  _landscapeConstraints = [@[] mutableCopy];
  
  TMALVariableBindingsAMNO( one, two );

  TMAL_ADDA_VISUAL( _portraitConstraints, @"H:|-20-[one]-20-|" );
  TMAL_ADDA_VISUAL( _portraitConstraints, @"H:|-20-[two]-20-|" );
  TMAL_ADDA_VISUAL( _portraitConstraints, @"V:|-20-[one]-20-[two]-20-|" );
  TMAL_ADDA_ATTR( _portraitConstraints, one, two, NSLayoutAttributeHeight, NSLayoutRelationEqual );
  
  TMAL_ADDA_VISUAL( _landscapeConstraints, @"H:|-20-[one]-20-[two]-20-|" );
  TMAL_ADDA_VISUAL( _landscapeConstraints, @"V:|-20-[one]-20-|" );
  TMAL_ADDA_VISUAL( _landscapeConstraints, @"V:|-20-[two]-20-|" );
  TMAL_ADDA_ATTR( _landscapeConstraints, one, two, NSLayoutAttributeWidth, NSLayoutRelationEqual );
  
  if ( UIDeviceOrientationIsLandscape( [[UIDevice currentDevice] orientation] ) ) {
    [self addConstraints:_landscapeConstraints];
  } else {
    [self addConstraints:_portraitConstraints];
  }
  
  return self;
}

- (void)willRotateToInterfaceOrientation:(UIInterfaceOrientation)toInterfaceOrientation duration:(NSTimeInterval)duration {
  if ( UIInterfaceOrientationIsLandscape( toInterfaceOrientation ) ) {
    [self removeConstraints:self.portraitConstraints];
    [self addConstraints:self.landscapeConstraints];
  } else {
    [self removeConstraints:self.landscapeConstraints];
    [self addConstraints:self.portraitConstraints];
  }
}

#pragma mark - Class

+ (NSString *)sampleName {
  return @"5 - Rotation";
}

@end
