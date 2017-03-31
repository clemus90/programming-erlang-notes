-module(variables).
-export([show/0]).

show() ->
    %variable definition => must start with an uppercase leter
    X = 123456789.
    %to see the value
    X.
    %use the variable
    X*X*X*X.
    %you cannot reasign a variable
    %X = 1234.
    %so = is not assignment but a pattern matching operator, and the variable x is bound to the initial value, but cannot change it.
    %variable scope is its lexical unit (function for example)