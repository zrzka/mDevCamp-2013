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

  // loginView je to modre okno uprosted a protoze v autolayout neni moznost
  // jak rict, ze chci aby se tato skupina view vycentrovala, tak se musi
  // vzdycky dat do separe view a to centrovat
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

  // loginView ma rozmer 320x480 s prioritou 1000 (nejvyssi)
  TMAL_ADDS_VISUAL( @"H:[loginView(320@1000)]" );
  TMAL_ADDS_VISUAL( @"V:[loginView(480@1000)]" );
  // a vuci superview (coz je self v tomto pripade) je vycentrovano
  TMAL_ADDS_CENTERX( loginView, self );
  TMAL_ADDS_CENTERY( loginView, self );
  
  // do loginView dam constrainy, ktere rikaji, ze backgroundImageView je pres cele loginView
  TMAL_ADD_VISUAL( loginView, @"H:|[backgroundImageView]|" );
  TMAL_ADD_VISUAL( loginView, @"V:|[backgroundImageView]|" );
  
  // v loginView je helpCenterButton vycentrovan (horizontalne) a 10px od spodniho okraje loginView
  TMAL_ADD_CENTERX( loginView, _helpCenterButton, loginView );
  TMAL_ADD_VISUAL( loginView, @"V:[_helpCenterButton]-10-|" );

  // v loginView ma signUpButton padding LEFT/RIGHT (viz. metrics dictionary)
  TMAL_ADD_VISUALM( loginView, @"H:|-LEFT-[_signUpButton]-RIGHT-|", metrics );
  // v loginView je signUpButton 10px nad helpCenterButton
  TMAL_ADD_VISUAL( loginView, @"V:[_signUpButton]-10-[_helpCenterButton]" );
  
  // v loginView ma formView padding LEFT/RIGHT (viz. metrics dictionary)
  TMAL_ADD_VISUALM( loginView, @"H:|-LEFT-[formView]-RIGHT-|", metrics );
  // v loginView je formView vertikalne vycentrovan
  TMAL_ADD_CENTERY( loginView, formView, loginView );
  
  // ve formView je nameField pres celou sirku (horizontalne)
  TMAL_ADD_VISUAL( formView, @"H:|[_nameField]|" );
  // ve formView je passwordField pres celou sirku (horizontalne)
  TMAL_ADD_VISUAL( formView, @"H:|[_passwordField]|" );
  // ve formView je logInButton pres celou sirku (horizontalne)
  TMAL_ADD_VISUAL( formView, @"H:|[_logInButton]|" );
  // ve formView je nahore nameField, hned pod nim passwordField, 10px mezera a loginButton
  // s tim, ze nameField zacina u okraje formView a loginButton konci u okraje formView
  TMAL_ADD_VISUAL( formView, @"V:|[_nameField][_passwordField]-10-[_logInButton]|" );

  return self;
}

#pragma mark - Class

+ (NSString *)sampleName {
  return @"7 - Login View";
}

@end
