! Copyright (C) 2016 Your name.
! See http://factorcode.org/license.txt for BSD license.

USING: accessors formatting kernel math.ranges math.parser sequences ;
IN: kakuro

TUPLE: acrosscell across ;
TUPLE: downcell down ;
TUPLE: downacrosscell down across ;
TUPLE: emptycell ;
TUPLE: valuecell values ;

: e ( -- e ) emptycell boa ;
: a ( n -- a ) acrosscell boa ;
: d ( n -- d ) downcell boa ;
: da ( d a -- da ) downacrosscell boa ;
: v ( -- v ) 9 [1,b] valuecell boa ;
: vv ( {} -- vv ) valuecell boa ;

GENERIC: draw ( item -- string )

: oneValue ( value -- str ) first "     %d    " sprintf ;
: drawMany ( values -- str ) [ number>string ] map " " prefix concat ;

M: emptycell draw drop "   -----  " ;
M: acrosscell draw across>> "   --\\%2d  " sprintf ;
M: downcell draw down>> "   %2d\\--  " sprintf ;
M: downacrosscell draw [ down>> ] [ across>> ] bi "   %2d\\%2d  " sprintf ;
M: valuecell draw values>> dup length 1 = [ oneValue ] [ drawMany ] if ;

: drawRow ( {} -- string ) [ draw ] map concat ;

