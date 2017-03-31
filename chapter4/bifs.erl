-module(bifs).
-export([test/0]).

test() ->
    list_to_tuple([12,cat,"hello"]),
    time().
    %functions defined as part of erlang, mostly implemented as primitive operations outside erlang
    %due to the difficulty of implementing it on erlang.
    %most of them are autoimported.