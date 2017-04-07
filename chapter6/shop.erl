-module(shop).
-export([cost/1]).

cost(oranges) -> 5;
cost(newspaper) -> 8;
cost(apples) -> 2;
cost(pears) -> 9;
cost(milk) -> 7.

%shop:cost(socks) will throw an exception
%to explicitly raise errors use
%throw(Exception), exit(Exception), error(Exception).

%exit is used when you really want to terminate the current process

%throw is used when the caller might want to catch the error,
%two options are available, enclose in try catch, or ignore the exception.

%error is used to notify a showstopper, not expected, works in the same level as
%internally generated errors.

%there are two ways of handling errors, one is enclossing expressions between try ... catch
%the other one is enclosing the calls in a catch expression.