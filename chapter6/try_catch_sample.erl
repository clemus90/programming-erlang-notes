-module(try_catch_sample).
-export([test/0]).

test() ->
    %try catch expressions returns a value
    % X = try ... end,

    % try catch is very similar to case expressions, basically they are case expressions
    % with catch and after blocks

    %try exp of, the pattern is evaluated over exp
    %   patt1 -> Expr, for every pattern, if it matches ,the Expr gets returned
    % catch, begin of catch block
    % ExceptionType1:exPattern, ExceptionType is one of throw, exit or error), the exPattern is
    %                           matched vs the error throwed.
    % after, begin of after block, everything after it is used to clean up after exceptions.

    %you can omit the patterns after the of, in cases where you need to return the initial expression as is
    %the after clause is also optional.