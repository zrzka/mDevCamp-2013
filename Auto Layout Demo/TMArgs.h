//
//  TMArgs.h
//  Auto Layout Demo
//
//  Created by Robert Vojta on 24.05.13.
//  Copyright (c) 2013 Tapmates, Inc. All rights reserved.
//

#include <stdarg.h>

/*
 * Takova berlicka na vypocet poctu argumentu u variadickych maker.
 *
 * Maximum je myslim 64 a v tehle konrektni implementaci je to 20. Pokud
 * jich chcete vic, tak jednoduse pokracujte od 21, ... a u dalsiho makra
 * od x21 ...
 *
 */
#define TM_NARGS( ... ) TM_NARGS1( __VA_ARGS__, 20, 19, 18, 17, 16, 15, 14, 13, 12, 11, 10, 9, 8, 7, 6, 5, 4, 3, 2, 1, 0 )
#define TM_NARGS1( x1, x2, x3, x4, x5, x6, x7, x8, x9, x10, x11, x12, x13, x14, x15, x16, x17, x18, x19, x20, n, ... ) n
