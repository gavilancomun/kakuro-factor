
USING: tools.test kakuro combinators.smart sequences ;
IN: kakuro.tests

[ "   -----  " ] [ e draw ] unit-test
[ "   --\\ 5  " ] [ 5 a draw ] unit-test
[ "    4\\--  " ] [ 4 d draw ] unit-test
[ "    3\\ 4  " ] [ 3 4 da draw ] unit-test
[ " 123456789" ] [ v draw ] unit-test
[ " 12......." ] [ { 1 2 } vv draw ] unit-test

: line1 ( -- seq ) [ 3 4 da v { 1 2 } vv 4 d e 5 a { 4 } vv { 1 } vv ] output>array ;

[ "    3\\ 4   123456789 12.......    4\\--     -----     --\\ 5       4         1    \n" ] [ line1 drawRow ] unit-test

