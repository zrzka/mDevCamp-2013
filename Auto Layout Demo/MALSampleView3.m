//
//  MALSampleView3.m
//  Auto Layout Demo
//
//  Created by Robert Vojta on 24.05.13.
//  Copyright (c) 2013 Tapmates, Inc. All rights reserved.
//

#import "MALSampleView3.h"
#import "MALView.h"

@implementation MALSampleView3

#pragma mark - Lifecycle

- (id)initWithFrame:(CGRect)frame {
  self = [super initWithFrame:frame];
  if ( !self ) {
    return nil;
  }
  
  MALView *tl = [[MALView alloc] initWithFrame:CGRectZero];
  tl.backgroundColor = [UIColor greenColor];
  tl.title = @"Top Left";
  [self addSubview:tl];
  
  MALView *tr = [[MALView alloc] initWithFrame:CGRectZero];
  tr.backgroundColor = [UIColor redColor];
  tr.title = @"Top Right";
  [self addSubview:tr];
  
  MALView *bl = [[MALView alloc] initWithFrame:CGRectZero];
  bl.backgroundColor = [UIColor blueColor];
  bl.title = @"Bottom Left";
  [self addSubview:bl];
  
  MALView *br = [[MALView alloc] initWithFrame:CGRectZero];
  br.backgroundColor = [UIColor yellowColor];
  br.title = @"Bottom Right";
  [self addSubview:br];
  
  TMALVariableBindingsAMNO( tl, tr, bl, br );
  // 20px zleva vuci superview (|) - topleft - 20px mezera - top right - 20px zprava vuci superview (|)
  TMAL_ADDS_VISUAL( @"H:|-20-[tl]-20-[tr]-20-|" );
  // 20px zleva vuci superview (|) - bottomleft - 20px mezera - bottom right - 20px zprava vuci superview (|)
  TMAL_ADDS_VISUAL( @"H:|-20-[bl]-20-[br]-20-|" );
  // 20px vrsek vuci superview (|) - top left - 20px mezera - bottom left - 20px spodek vuci superview (|)
  TMAL_ADDS_VISUAL( @"V:|-20-[tl]-20-[bl]-20-|" );
  // 20px vrsek vuci superview (|) - top right - 20px mezera - bottom right - 20px spodek vuci superview (|)
  TMAL_ADDS_VISUAL( @"V:|-20-[tr]-20-[br]-20-|" );

  // top left a top right maji stejnou sirku
  TMAL_ADDS_ATTR( tl, tr, NSLayoutAttributeWidth, NSLayoutRelationEqual );
  
  // bottom left a bottom right maji stejnou sirku
  TMAL_ADDS_ATTR( bl, br, NSLayoutAttributeWidth, NSLayoutRelationEqual );

  // top left a top right maji stejnou vysku
  TMAL_ADDS_ATTR( tl, tr, NSLayoutAttributeHeight, NSLayoutRelationEqual );
  
  // bottom left a bottom right maji stejnou vysku
  TMAL_ADDS_ATTR( bl, br, NSLayoutAttributeHeight, NSLayoutRelationEqual );

  // bottom left ma 30% vysky top left (a protoze bottom left a bottom right maji stejnou vysku,
  // bude mit i bottom right 30% vysky top left/right)
  TMAL_ADDS_ATTRM( bl, tl, NSLayoutAttributeHeight, NSLayoutRelationEqual, 0.3 );
  
  return self;
}

#pragma mark - Class

+ (NSString *)sampleName {
  return @"3 - Four views";
}

@end
