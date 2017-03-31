-module(shop2).
-export([total/1]).
-import(simple_list_processing, [map/2, sum/1]).

total(L) -> sum(map(fun({What, N}) -> shop:cost(What) * N end, L)).