! Copyright (C) 2016 Your name.
! See http://factorcode.org/license.txt for BSD license.

USING: accessors formatting hash-sets kernel locals math.ranges math.parser sequences sets ;
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
: v ( -- v ) 9 [1,b] >hash-set valuecell boa ;
: vv ( {} -- vv ) >hash-set valuecell boa ;

GENERIC: draw ( cell -- str )

:: oneOfMany ( n values -- str ) n values in? [ n number>string ] [ "." ] if ;

: drawOne ( value -- str ) members first "     %d    " sprintf ;
:: drawMany ( values -- str ) 9 [1,b] [ values oneOfMany ] map " " prefix concat ;

M: emptycell draw drop "   -----  " ;
M: acrosscell draw across>> "   --\\%2d  " sprintf ;
M: downcell draw down>> "   %2d\\--  " sprintf ;
M: downacrosscell draw [ down>> ] [ across>> ] bi "   %2d\\%2d  " sprintf ;
M: valuecell draw values>> dup cardinality 1 = [ drawOne ] [ drawMany ] if ;

: drawRow ( seq -- str ) [ draw ] map concat "\n" append ;

