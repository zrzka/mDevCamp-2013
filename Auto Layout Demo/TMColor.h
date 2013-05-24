//
//  TMColor.h
//  Auto Layout Demo
//
//  Created by Robert Vojta on 24.05.13.
//  Copyright (c) 2013 Tapmates, Inc. All rights reserved.
//

#define TM_UICOLOR( __red, __green, __blue ) \
  [UIColor colorWithRed:( __red ) / 255.0 green:( __green ) / 255.0 blue:( __blue ) / 255.0 alpha:1.0]

#define TM_UICOLORA( __red, __green, __blue, __alpha ) \
  [UIColor colorWithRed:( __red ) / 255.0 green:( __green ) / 255.0 blue:( __blue ) / 255.0 alpha:(__alpha)]
