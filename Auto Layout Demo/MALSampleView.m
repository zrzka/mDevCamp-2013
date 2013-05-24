//
//  MALSampleView.m
//  Auto Layout Demo
//
//  Created by Robert Vojta on 24.05.13.
//  Copyright (c) 2013 Tapmates, Inc. All rights reserved.
//

#import "MALSampleView.h"

@interface MALSampleView()

@property (nonatomic,strong) UIBarButtonItem *exerciseAmbiguityButton;

@end

@implementation MALSampleView

#pragma mark - Lifecycle

- (id)initWithFrame:(CGRect)frame {
  self = [super initWithFrame:frame];
  if ( !self ) {
    return nil;
  }
  
  _exerciseAmbiguityButton = [[UIBarButtonItem alloc] initWithTitle:@"EA"
                                                              style:UIBarButtonItemStyleBordered
                                                             target:self
                                                             action:@selector(performExerciseAmbiguityInLayout:)];
  
  return self;
}

- (void)didDisplaySampleView {
}

- (void)willRotateToInterfaceOrientation:(UIInterfaceOrientation)toInterfaceOrientation duration:(NSTimeInterval)duration {  
}

- (void)didRotateFromInterfaceOrientation:(UIInterfaceOrientation)fromInterfaceOrientation {
}


- (BOOL)exerciseViewAndAllSubviews:(UIView *)view {
  if ( [view hasAmbiguousLayout] ) {
    [view exerciseAmbiguityInLayout];
    return YES;
  }
  
  for ( UIView *subview in view.subviews ) {
    if ( [self exerciseViewAndAllSubviews:subview] ) {
      return YES;
    }
  }
  return NO;
}

- (void)performExerciseAmbiguityInLayout:(id)sender {
  [self exerciseViewAndAllSubviews:self];
}

- (NSArray *)customButtonItems {
  return nil;
}

- (NSArray *)rightButtonItems {
  NSMutableArray *items = [@[ self.exerciseAmbiguityButton ] mutableCopy];
  if ( self.customButtonItems.count ) {
    [items addObjectsFromArray:self.customButtonItems];
  }
  return items;
}

#pragma mark - Class

+ (NSString *)sampleName {
  return @"MALSampleView";
}

@end
