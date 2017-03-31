-module(shop).
-export([cost/1, total/1]).

cost(oranges) -> 5;
cost(newspaper) -> 8;
cost(apples) -> 2;
cost(pears) -> 9;
cost(milk) -> 7.

%cost defined for a finite list of atoms, trying to access an undefined pattern will throw an error

total([{What, N}|T]) -> shop:cost(What) * N + total(T);
total([]) -> 0.

%Buy = [{oranges, 4}, {newspaper, 1}, {apples, 10}, {pears, 6}, {milk, 3}].