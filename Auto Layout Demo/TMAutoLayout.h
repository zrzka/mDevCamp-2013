//
//  TMAutoLayout.h
//  Auto Layout Demo
//
//  Created by Robert Vojta on 24.05.13.
//  Copyright (c) 2013 Tapmates, Inc. All rights reserved.
//

#import "TMArgs.h"

#pragma mark - Helpers

static inline NSDictionary *__TMDictionaryOfVariableBindings( BOOL autoresizingMaskOff, unsigned int count, ... ) {
  if ( count <= 0 ) {
    return nil;
  }
  
  va_list ap;
  va_start( ap, count );
  
  NSString *allNames = va_arg( ap, NSString * );
  NSArray *names = [allNames componentsSeparatedByString:@","];
  
  if ( names.count != count ) {
    return nil;
  }
  
  NSMutableDictionary *result = [@{} mutableCopy];
  id arg;
  for ( unsigned int i = 0 ; i < count ; i ++ ) {
    if ( ( arg = va_arg( ap, id ) ) ) {
      result[ [names[i] stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceCharacterSet]] ] = arg;
      if ( autoresizingMaskOff && [arg isKindOfClass:[UIView class]] ) {
#if TARGET_OS_IPHONE
        [( UIView * )arg setTranslatesAutoresizingMaskIntoConstraints:NO];
#else
        [( NSView * )arg setTranslatesAutoresizingMaskIntoConstraints:NO];
#endif
      }
    }
  }
  va_end( ap );
  
  return [result copy];
}

#define TMALVariableBindings( ... ) NSDictionary *__vB = __TMDictionaryOfVariableBindings( NO, TM_NARGS( __VA_ARGS__ ), @"" # __VA_ARGS__, __VA_ARGS__ )

#define TMALVariableBindingsAMNO( ... ) NSDictionary *__vB = __TMDictionaryOfVariableBindings( YES, TM_NARGS( __VA_ARGS__ ), @"" # __VA_ARGS__, __VA_ARGS__ )

#pragma mark - Visual

#define TMAL_VISUAL( __visual ) \
  [NSLayoutConstraint constraintsWithVisualFormat:(__visual) options:0 metrics:nil views:__vB]

#define TMAL_VISUALM( __visual, __metrics ) \
  [NSLayoutConstraint constraintsWithVisualFormat:(__visual) options:0 metrics:(__metrics) views:__vB]

#define TMAL_ADD_VISUAL( __view, __visual ) [(__view) addConstraints:TMAL_VISUAL( (__visual) )]
#define TMAL_ADD_VISUALM( __view, __visual, __metrics ) [(__view) addConstraints:TMAL_VISUALM( (__visual), (__metrics) )]

#define TMAL_ADDS_VISUAL( __visual ) TMAL_ADD_VISUAL( self, (__visual) )
#define TMAL_ADDS_VISUALM( __visual, __metrics ) TMAL_ADD_VISUALM( self, (__visual), (__metrics) )

#define TMAL_ADDA_VISUAL( __array, __visual ) [(__array) addObjectsFromArray:TMAL_VISUAL( (__visual) )]
#define TMAL_ADDA_VISUALM( __array, __visual, __metrics ) [(__array) addObjectsFromArray:TMAL_VISUALM( (__visual), (__metrics) )]

#pragma mark - Attributes

#define TMAL_ATTR( __item, __relativeTo, __attr, __relation ) \
  [NSLayoutConstraint constraintWithItem:( __item )       \
    attribute:( __attr )       \
    relatedBy:( __relation )   \
    toItem:( __relativeTo ) \
    attribute:( __attr )       \
    multiplier:1.0              \
    constant:0.0]

#define TMAL_ATTRM( __item, __relativeTo, __attr, __relation, __mul ) \
  [NSLayoutConstraint constraintWithItem:( __item )       \
    attribute:( __attr )       \
    relatedBy:( __relation )   \
    toItem:( __relativeTo ) \
    attribute:( __attr )       \
    multiplier:(__mul)              \
    constant:0.0]

#define TMAL_ADD_ATTR( __view, __item, __relativeTo, __attr, __relation ) [(__view) addConstraint:TMAL_ATTR( (__item), (__relativeTo), (__attr), (__relation ) )]
#define TMAL_ADDS_ATTR( __item, __relativeTo, __attr, __relation ) TMAL_ADD_ATTR( self, (__item), (__relativeTo), (__attr), (__relation ) )
#define TMAL_ADDA_ATTR( __array, __item, __relativeTo, __attr, __relation ) [(__array) addObject:TMAL_ATTR( (__item), (__relativeTo), (__attr), (__relation ) )]

#define TMAL_ADD_ATTRM( __view, __item, __relativeTo, __attr, __relation, __mul ) \
  [(__view) addConstraint:TMAL_ATTRM( (__item), (__relativeTo), (__attr), (__relation ), (__mul) )]

#define TMAL_ADDS_ATTRM( __item, __relativeTo, __attr, __relation, __mul )\
  TMAL_ADD_ATTRM( self, (__item), (__relativeTo), (__attr), (__relation ), (__mul ) )

#define TMAL_ADDA_ATTRM( __array, __item, __relativeTo, __attr, __relation, __mul ) \
  [(__array) addObject:TMAL_ATTRM( (__item), (__relativeTo), (__attr), (__relation ), (__mul) )]

#pragma mark - Centering

#define TMAL_CENTERX( __item, __relativeTo ) TMAL_ATTR( (__item), (__relativeTo), NSLayoutAttributeCenterX, NSLayoutRelationEqual )
#define TMAL_ADD_CENTERX( __view, __item, __relativeTo ) [(__view) addConstraint:TMAL_CENTERX( (__item), (__relativeTo) )]
#define TMAL_ADDS_CENTERX( __item, __relativeTo) TMAL_ADD_CENTERX( self, (__item), (__relativeTo) )
#define TMAL_ADDA_CENTERX( __array, __item, __relativeTo ) [(__array) addObject:TMAL_CENTERX( (__item), (__relativeTo) )]

#define TMAL_CENTERY( __item, __relativeTo ) TMAL_ATTR( (__item), (__relativeTo), NSLayoutAttributeCenterY, NSLayoutRelationEqual )
#define TMAL_ADD_CENTERY( __view, __item, __relativeTo ) [(__view) addConstraint:TMAL_CENTERY( (__item), (__relativeTo) )]
#define TMAL_ADDS_CENTERY( __item, __relativeTo) TMAL_ADD_CENTERY( self, (__item), (__relativeTo) )
#define TMAL_ADDA_CENTERY( __array, __item, __relativeTo ) [(__array) addObject:TMAL_CENTERY( (__item), (__relativeTo) )]



