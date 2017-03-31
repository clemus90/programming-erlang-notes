-module(floating_point).
-export([show/0]).

show() ->
    5/3,
    %division is converted to floating point, even when the division is exact
    4/2,
    %obtaining integer values for division and remainder respectively
    5 div 3,
    5 rem 3.