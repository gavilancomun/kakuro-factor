
USING: tools.test kakuro  combinators.smart sequences ;
IN: kakuro.tests

: line1 ( -- seq ) [ 3 4 da v { 1 2 } vv 4 d e 5 a { 4 } vv { 1 } vv ] output>array ;

[ "    3\\ 4   123456789 12.......    4\\--     -----     --\\ 5       4         1    \n"] [ line1 drawRow ] unit-test

