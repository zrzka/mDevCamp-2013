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
  // Celkem dost protestuj pokud mi bude chtit autolayout nastavit sirku vetsi nez moji prirozenou
  [_nameLabel setContentHuggingPriority:UILayoutPriorityDefaultHigh forAxis:UILayoutConstraintAxisHorizontal];
  // Celkem dost protestuj pokud mi bude chtit autolayout nastavit sirku mensi nez moji prirozenou
  [_nameLabel setContentCompressionResistancePriority:UILayoutPriorityDefaultHigh forAxis:UILayoutConstraintAxisHorizontal];
  [self addSubview:_nameLabel];
  
  _passwordLabel = [[UILabel alloc] initWithFrame:CGRectZero];
  _passwordLabel.backgroundColor = [UIColor clearColor];
  // Celkem dost protestuj pokud mi bude chtit autolayout nastavit sirku vetsi nez moji prirozenou
  [_passwordLabel setContentHuggingPriority:UILayoutPriorityDefaultHigh forAxis:UILayoutConstraintAxisHorizontal];
  // Celkem dost protestuj pokud mi bude chtit autolayout nastavit sirku mensi nez moji prirozenou
  [_passwordLabel setContentCompressionResistancePriority:UILayoutPriorityDefaultHigh forAxis:UILayoutConstraintAxisHorizontal];
  [self addSubview:_passwordLabel];
  
  UITextField *nameField = [[UITextField alloc] initWithFrame:CGRectZero];
  [nameField setBorderStyle:UITextBorderStyleRoundedRect];
  [nameField setPlaceholder:@"Your name ..."];
  // Takrka neprotestuj pokud mi autolayout bude chtit nastavit sirku vetsi nez moji prirozenou
  [nameField setContentHuggingPriority:UILayoutPriorityDefaultLow forAxis:UILayoutConstraintAxisHorizontal];
  [self addSubview:nameField];
  
  UITextField *passwordField = [[UITextField alloc] initWithFrame:CGRectZero];
  [passwordField setBorderStyle:UITextBorderStyleRoundedRect];
  [passwordField setPlaceholder:@"Your password ..."];
  // Takrka neprotestuj pokud mi autolayout bude chtit nastavit sirku vetsi nez moji prirozenou
  [passwordField setContentHuggingPriority:UILayoutPriorityDefaultLow forAxis:UILayoutConstraintAxisHorizontal];
  [self addSubview:passwordField];
  
  TMALVariableBindingsAMNO( _nameLabel, _passwordLabel, nameField, passwordField );

  // 20px vrsek vuci superview (|) - nameLabel - 20px mezera - passwordLabel
  TMAL_ADDS_VISUAL( @"V:|-20-[_nameLabel]-20-[_passwordLabel]" );
  // 20px vrsek vuci superview (|) - nameLabel - 20px mezera - nameField
  TMAL_ADDS_VISUAL( @"H:|-20-[_nameLabel]-20-[nameField]-20-|" );
  // 20px zleva vuci superview (|) - passwordLabel - 20px mezera - passwordField - 20px zprava vuci superview (|)
  TMAL_ADDS_VISUAL( @"H:|-20-[_passwordLabel]-20-[passwordField]-20-|" );
  // nameField a nameLabel zarovnej podle baseline
  TMAL_ADDS_ATTR( nameField, _nameLabel, NSLayoutAttributeBaseline, NSLayoutRelationEqual );
  // passwordLabel a passwordField zarovnej podle baseline
  TMAL_ADDS_ATTR( passwordField, _passwordLabel, NSLayoutAttributeBaseline, NSLayoutRelationEqual );
  // labely maji stejnou sirku
  TMAL_ADDS_ATTR( _passwordLabel, _nameLabel, NSLayoutAttributeWidth, NSLayoutRelationEqual );
  // fieldy maji stejnou sirku
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
  // Jenom vymenim text a cele se to presklada (dobry pro lokalizaci, apod.)
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
