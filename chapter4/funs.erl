-module(funs).
-export([test/0, for/3]).

test() ->
    Double = fun(X)-> 2*X end,
    Double(2),
    %an anonymous function is defined between fun and end, its invocations is the same as the functions that we have written before
    Hypot = fun(X,Y) -> math:sqrt(X*X + Y*Y) end,
    Hypot(3,4),% the number of arguments is checked.
    %Hypot(3) will fail
    TempConvert = fun({c,C}) -> {f,32 + C*9/5};
        ({f,F}) -> {c, (F-32)*5/9}
    end,
    TempConvert({c,100}),
    TempConvert({f,212}),
    TempConvert({c,0}),
    %functions that receive funs
    %map
    L = [1,2,3,4],
    lists:map(fun(X) -> 2*X end, L),
    %last statement returns [2,4,6,8]
    %filter
    Even = fun(X) -> (X rem 2) =:= 0 end,
    Even(8), % true
    Even(7), % false
    lists:map(Even, [1,2,3,4,5,6,7,8]), %[false, true, false, true, false, true, false, true]
    lists:filter(Even, [1,2,3,4,5,6,7,8]), %[2,4,6,8]
    % last statement denotes the filter

    % lists that returns lists
    Fruit = [apple, pear, orange],
    MakeTest = fun(L) -> (fun(X) -> lists:member(X,L) end) end,
    IsFruit = MakeTest(Fruit),
    IsFruit(pear), %true
    IsFruit(apple), %true
    IsFruit(dog), %false
    lists:filter(IsFruit, [dog, orange, cat, apple, bear]), % [orange, apple]

    Mult = fun(Times) -> (fun(X) -> X * Times end) end,
    Triple = Mult(3),
    Triple(5). %15

for(Max, Max, F) -> [F(Max)];
for(I, Max, F) -> [F(I)|for(I+1, Max, F)].

%use the function like funs:for(1, 10, fun(I) -> I end).
% funs:for(1, 10, fun(I) -> I*I end).