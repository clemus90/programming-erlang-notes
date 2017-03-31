-module(simple_list_processing).
-export([sum/1, map/2]).

sum([H|T]) -> H + sum(T);
sum([]) -> 0.

% mylists:sum([1,3,10]).
% should be 14

map(_,[]) -> [];
map(F, [H|T]) -> [F(H)|map(F,T)].