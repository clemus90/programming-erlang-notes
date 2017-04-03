-module(case_if_expressions).
-export([filter/2]).

filter(P, [H|T]) ->
    case P(H) of
        true -> [H|filter(P,T)];
        false -> filter(P,T)
    end;
filter(P, []) ->
    [].

% case Expression of PatternN [when Guard N] -> Expr_seqn ...
% the expression is going to be evaluated and matchen against the N patterns, first match is going to return
% the value of the corresponding Expr_seqn
...
if(A>0) {
    do_this();
}
...
% similar to case expression, but just using guards, there is no pattern matching in this case, is important to notice
% that this example is dangerous since there is no fallback execution, if A is not greater than 0 erlang will throw an error