-module(list_comprehension).
-export(test/0, qsort/1, pythag/1).

test() ->
    L = [1,2,3,4,5],
    lists:map(fun(X) -> 2*X end, L),
    %[2,4,6,8,10]
    [2*X || X <- L].
    %same result
    Buy = [{oranges, 4},{newspaper, 1},{apple, 10},{pear, 6}, {milk, 3}],
    [{Name, 2*Number} || {Name, Number} <- Buy],
    %[{oranges, 8},{newspaper, 2},{apple, 20},{pear, 12}, {milk, 6}].
    [{shop:cost(A), B} || {A, B} <- Buy],
    %[{5,4},{8,1},{2,10},{9,6},{7,3}}}]
    [shop:cost(A)* B || {A, B} <- Buy],
    %[20,8,20,54,21]
    lists:sum([shop:cost(A)* B || {A, B} <- Buy]).
    %123

total(L) -> lists:sum([shop:cost(A)* B || {A, B} <- L]).
% the part after the || can be a generator (<-) a bitstring generator (<=) or a filter (functions that return booleans)
[X || {a, X} <- [{a,1},{b,2},{c,3},{a,4},hello, "wow"]]
% [1,4] generator acting as filter

%Quicksort
qsort([]) -> [];
qsort([Pivot|T]) ->
    qsort(X || X <- T, X < Pivot])
    ++ [Pivot] ++
    qsort([X|| X <- T, X >= Pivot]).

%Pythagorean Triplets
pythag(N) ->
    [{A,B,C} ||
        A <- lists:seq(1,N),
        B <- lists:seq(1,N),
        C <- lists:seq(1,N),
        A + B + C =< N,
        A*A + B*B =:= C*C
    ].

% Anagrams
perms([]) -> [[]];
perms(L) -> [[H|T] || H <- L, T <- perms(L--[H])].
