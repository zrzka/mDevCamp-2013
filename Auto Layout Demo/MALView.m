//
//  MALView.m
//  Auto Layout Demo
//
//  Created by Robert Vojta on 24.05.13.
//  Copyright (c) 2013 Tapmates, Inc. All rights reserved.
//

#import "MALView.h"

@interface MALView()

@property (nonatomic,strong) UILabel *label;

@end

@implementation MALView

#pragma mark - Lifecycle

- (id)initWithFrame:(CGRect)frame {
  self = [super initWithFrame:frame];
  if ( !self ) {
    return nil;
  }

  self.clipsToBounds = YES;
  self.contentMode = UIViewContentModeRedraw;
  self.backgroundColor = [UIColor greenColor];
  _borderColor = [UIColor blackColor];
  
  _label = [[UILabel alloc] initWithFrame:CGRectZero];
  _label.backgroundColor = [UIColor clearColor];
  _label.textAlignment = NSTextAlignmentCenter;
  [self addSubview:_label];
  
  TMALVariableBindingsAMNO( _label );
  TMAL_ADDS_VISUAL( @"H:|[_label]|" );
  TMAL_ADDS_VISUAL( @"V:|[_label]|" );
  
  _forcedFittingSize = (CGSize){0,0};
  _forcedIntrinsicContentSize = (CGSize){0,0};
  
  return self;
}

- (void)drawRect:(CGRect)rect {
  [super drawRect:rect];
  
  static const CGFloat dashPattern[] = { 5.0, 5.0 };

  [self.borderColor setStroke];
  UIBezierPath *path = [UIBezierPath bezierPathWithRect:self.bounds];
  [path setLineWidth:3.0];
  [path setLineDash:dashPattern count:2 phase:2];
  [path stroke];
}

// Jenom pro demonstraci
- (CGSize)systemLayoutSizeFittingSize:(CGSize)targetSize {
  if ( CGSizeEqualToSize( self.forcedFittingSize, CGSizeZero ) ) {
    return [super systemLayoutSizeFittingSize:targetSize];
  }
  return self.forcedFittingSize;
}

// Jenom pro demonstraci, pokud je CGSizeZero, tak nedelej nic a pokud si tam
// neco nastavime tak to vratime
- (CGSize)intrinsicContentSize {
  if ( CGSizeEqualToSize( self.forcedIntrinsicContentSize, CGSizeZero ) ) {
    return [super intrinsicContentSize];
  }
  return self.forcedIntrinsicContentSize;
}

- (void)setForcedIntrinsicContentSize:(CGSize)forcedIntrinsicContentSize {
  _forcedIntrinsicContentSize = forcedIntrinsicContentSize;
  /*
   * TOHLE JE VELMI DULEZITE
   *
   * Pokud view vi, ze se zmenila jeho prirozena velikost, musi to autolayoutu
   * oznamit a na to slouzi invalidateIntrinsicContentSize.
   *
   * Pokud to nezavolate, autolayout nevi, ze se zmenila velikost a nic neudela.
   */
  [self invalidateIntrinsicContentSize];
}

#pragma mark - Properties

- (void)setBorderColor:(UIColor *)borderColor {
  _borderColor = [borderColor copy];
  [self setNeedsDisplay];
}

- (void)setTitle:(NSString *)title {
  [self.label setText:title];
}

- (NSString *)title {
  return self.label.text;
}

@end
