-module(guards).
-export([max/2]).

max(X,Y) when X > Y -> X;
max(X,Y) -> Y.

%located after the when word
%cannnot contain user defined functions
%can contain atoms, where true is the only one that passes the guard
%calls to guard predicates and BIFs
%term comparison
%arithmetic expressions
%boolean expressions
%Shor-circuit boolean expressions
f(X,Y) when is_integer(X), X > Y, Y < 6 -> ...
%a sequence of expresions separated by , compose a guard, all expressions must evaluate to true for the guard to be true
X=:=dog;X=:=cat
%a sequence of guards separated by ; compose a guard sequence, at least one of the guards should be true for the sequence to be true
f(X) when (X==0) or (1/X >= 2)
g(X) when (X==0) orelse (1/X >= 2)
% the difference between or and orelse is that orelse is a shortCircuit operator, so f(X) would fail with X equals to 0, and g won't
%same relationship between 'and' and 'andelse'