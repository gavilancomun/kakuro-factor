! Copyright (C) 2016 Your name.
! See http://factorcode.org/license.txt for BSD license.

USING: tools.test kakuro sequences ;
IN: kakuro.tests

: line ( -- {} ) { } 3 4 da suffix v suffix { 1 2 } vv suffix 4 d suffix e suffix 5 a suffix { 4 } vv suffix { 1 } vv suffix ;

[ "    3\\ 4   123456789 12.......    4\\--     -----     --\\ 5       4         1    \n"] [ line drawRow ] unit-test

