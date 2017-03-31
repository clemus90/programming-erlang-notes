-module(geometry1).
-export([test/0, area/1]).

test() ->
    12 = area({rectangle, 3, 4}),
    144 = area({square, 12}),
    tests_worked.

area({rectangle, Width, Height}) -> Width * Height;
area({square, Side}) -> Side * Side;
area({circle, Radius}) -> 3.14159 * Radius * Radius.

%the test method should print tests_worked when every pattern matches
% commas are for function calls, data constructors, and patterns
% semicolons separate clauses 
% dots to separate functions or commands.