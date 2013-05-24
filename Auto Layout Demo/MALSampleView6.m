//
//  MALSampleView6.m
//  Auto Layout Demo
//
//  Created by Robert Vojta on 24.05.13.
//  Copyright (c) 2013 Tapmates, Inc. All rights reserved.
//

#import "MALSampleView6.h"

@interface MALSampleView6()

@property (nonatomic,strong) UILabel *nameLabel;
@property (nonatomic,strong) UILabel *passwordLabel;

@end

@implementation MALSampleView6

#pragma mark - Lifecycle

- (id)initWithFrame:(CGRect)frame {
  self = [super initWithFrame:frame];
  if ( !self ) {
    return nil;
  }
  
  _nameLabel = [[UILabel alloc] initWithFrame:CGRectZero];
  _nameLabel.backgroundColor = [UIColor clearColor];
  [_nameLabel setContentHuggingPriority:UILayoutPriorityDefaultHigh forAxis:UILayoutConstraintAxisHorizontal];
  [_nameLabel setContentCompressionResistancePriority:UILayoutPriorityDefaultHigh forAxis:UILayoutConstraintAxisHorizontal];
  [self addSubview:_nameLabel];
  
  _passwordLabel = [[UILabel alloc] initWithFrame:CGRectZero];
  _passwordLabel.backgroundColor = [UIColor clearColor];
  [_passwordLabel setContentHuggingPriority:UILayoutPriorityDefaultHigh forAxis:UILayoutConstraintAxisHorizontal];
  [_passwordLabel setContentCompressionResistancePriority:UILayoutPriorityDefaultHigh forAxis:UILayoutConstraintAxisHorizontal];
  [self addSubview:_passwordLabel];
  
  UITextField *nameField = [[UITextField alloc] initWithFrame:CGRectZero];
  [nameField setBorderStyle:UITextBorderStyleRoundedRect];
  [nameField setPlaceholder:@"Your name ..."];
  [nameField setContentHuggingPriority:UILayoutPriorityDefaultLow forAxis:UILayoutConstraintAxisHorizontal];
  [self addSubview:nameField];
  
  UITextField *passwordField = [[UITextField alloc] initWithFrame:CGRectZero];
  [passwordField setBorderStyle:UITextBorderStyleRoundedRect];
  [passwordField setPlaceholder:@"Your password ..."];
  [passwordField setContentHuggingPriority:UILayoutPriorityDefaultLow forAxis:UILayoutConstraintAxisHorizontal];
  [self addSubview:passwordField];
  
  TMALVariableBindingsAMNO( _nameLabel, _passwordLabel, nameField, passwordField );

  TMAL_ADDS_VISUAL( @"V:|-20-[_nameLabel]-20-[_passwordLabel]" );
  TMAL_ADDS_VISUAL( @"H:|-20-[_nameLabel]-20-[nameField]-20-|" );
  TMAL_ADDS_VISUAL( @"H:|-20-[_passwordLabel]-20-[passwordField]-20-|" );
  TMAL_ADDS_ATTR( nameField, _nameLabel, NSLayoutAttributeBaseline, NSLayoutRelationEqual );
  TMAL_ADDS_ATTR( passwordField, _passwordLabel, NSLayoutAttributeBaseline, NSLayoutRelationEqual );
  TMAL_ADDS_ATTR( _passwordLabel, _nameLabel, NSLayoutAttributeWidth, NSLayoutRelationEqual );
  TMAL_ADDS_ATTR( passwordField, nameField, NSLayoutAttributeWidth, NSLayoutRelationEqual );
  
  return self;
}

- (NSArray *)customButtonItems {
  return @[
           [[UIBarButtonItem alloc] initWithTitle:@"Switch" style:UIBarButtonItemStyleBordered target:self action:@selector(switchLabelTexts)]
           ];
}

- (void)didDisplaySampleView {
  [self switchLabelTexts];
}

- (void)switchLabelTexts {
  static BOOL longVariant = YES;
  longVariant = !longVariant;
  if ( longVariant ) {
    self.nameLabel.text = @"Naaaaaameeeeeeeeeeeeeeeeeeeeeeeeeeee";
    self.passwordLabel.text = @"Passssssssswoooooooooorrrrrrd";
  } else {
    self.nameLabel.text = @"Name";
    self.passwordLabel.text = @"Password";
  }
}

#pragma mark - Class

+ (NSString *)sampleName {
  return @"6 - Labels & fields";
}

@end
