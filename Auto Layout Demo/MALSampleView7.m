//
//  MALSampleView7.m
//  Auto Layout Demo
//
//  Created by Robert Vojta on 24.05.13.
//  Copyright (c) 2013 Tapmates, Inc. All rights reserved.
//

#import "MALSampleView7.h"

@interface MALSampleView7()

@property (nonatomic,strong) UITextField *nameField;
@property (nonatomic,strong) UITextField *passwordField;
@property (nonatomic,strong) UIButton *logInButton;
@property (nonatomic,strong) UIButton *signUpButton;
@property (nonatomic,strong) UIButton *helpCenterButton;

@end

@implementation MALSampleView7

#pragma mark - Lifecycle

- (id)initWithFrame:(CGRect)frame {
  self = [super initWithFrame:frame];
  if ( !self ) {
    return nil;
  }

  UIView *loginView = [[UIView alloc] initWithFrame:CGRectZero];
  [self addSubview:loginView];

  UIImageView *backgroundImageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"sampleBackground"]];
  backgroundImageView.contentMode = UIViewContentModeCenter;
  [loginView addSubview:backgroundImageView];
  
  NSMutableDictionary *attributes = [@{} mutableCopy];

  attributes[ NSFontAttributeName ] = [UIFont systemFontOfSize:10.0];
  attributes[ NSForegroundColorAttributeName ] = TM_UICOLORA( 255, 255, 255, 0.5 );
  attributes[ NSUnderlineStyleAttributeName ] = @( NSUnderlineStyleSingle );
  
  _helpCenterButton = [UIButton buttonWithType:UIButtonTypeCustom];
  [_helpCenterButton setAttributedTitle:[[NSAttributedString alloc] initWithString:@"Help Center"
                                                                        attributes:attributes]
                               forState:UIControlStateNormal];
  [loginView addSubview:_helpCenterButton];

  [attributes removeObjectForKey:NSUnderlineStyleAttributeName];
  attributes[ NSForegroundColorAttributeName ] = [UIColor whiteColor];
  
  _signUpButton = [UIButton buttonWithType:UIButtonTypeCustom];
  [_signUpButton setAttributedTitle:[[NSAttributedString alloc] initWithString:@"Sign Up for Facebook"
                                                                    attributes:attributes]
                           forState:UIControlStateNormal];
  [loginView addSubview:_signUpButton];
  
  UIView *formView = [[UIView alloc] initWithFrame:CGRectZero];
  [loginView addSubview:formView];
  
  _nameField = [[UITextField alloc] initWithFrame:CGRectZero];
  [_nameField setPlaceholder:@"Username"];
  [_nameField setBorderStyle:UITextBorderStyleRoundedRect];
  [formView addSubview:_nameField];

  _passwordField = [[UITextField alloc] initWithFrame:CGRectZero];
  [_passwordField setPlaceholder:@"Password"];
  [_passwordField setBorderStyle:UITextBorderStyleRoundedRect];
  [formView addSubview:_passwordField];
  
  _logInButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
  [_logInButton setTitle:@"Log In" forState:UIControlStateNormal];
  [formView addSubview:_logInButton];
  
  NSDictionary *metrics = @{ @"LEFT" : @( 20.0 ), @"RIGHT" : @( 20.0 ) };
  
  TMALVariableBindingsAMNO( loginView, _helpCenterButton, backgroundImageView, _signUpButton, formView, _nameField, _passwordField, _logInButton );

  TMAL_ADDS_VISUAL( @"H:[loginView(320@1000)]" );
  TMAL_ADDS_VISUAL( @"V:[loginView(480@1000)]" );
  TMAL_ADDS_CENTERX( loginView, self );
  TMAL_ADDS_CENTERY( loginView, self );
  
  TMAL_ADD_VISUAL( loginView, @"H:|[backgroundImageView]|" );
  TMAL_ADD_VISUAL( loginView, @"V:|[backgroundImageView]|" );
  
  TMAL_ADD_CENTERX( loginView, _helpCenterButton, loginView );
  TMAL_ADD_VISUAL( loginView, @"V:[_helpCenterButton]-10-|" );

  TMAL_ADD_VISUALM( loginView, @"H:|-LEFT-[_signUpButton]-RIGHT-|", metrics );
  TMAL_ADD_VISUAL( loginView, @"V:[_signUpButton]-10-[_helpCenterButton]" );
  
  TMAL_ADD_VISUALM( loginView, @"H:|-LEFT-[formView]-RIGHT-|", metrics );
  TMAL_ADD_CENTERY( loginView, formView, loginView );
  
  TMAL_ADD_VISUAL( formView, @"H:|[_nameField]|" );
  TMAL_ADD_VISUAL( formView, @"H:|[_passwordField]|" );
  TMAL_ADD_VISUAL( formView, @"H:|[_logInButton]|" );
  TMAL_ADD_VISUAL( formView, @"V:|[_nameField][_passwordField]-10-[_logInButton]|" );

  return self;
}

#pragma mark - Class

+ (NSString *)sampleName {
  return @"7 - Login View";
}

@end
