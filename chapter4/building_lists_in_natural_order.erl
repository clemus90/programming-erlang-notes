-module(building_lists_in_natural_order).
-export([test/0]).
test() ->
    nothing.

% the natural way of adding elements to a list in erlang
% is inserting at the head, and appending the current list
% using this approach will give you a reverse list, when taking an elements
% from an initial list, and pushing it to the result one.
% is highly recommented to use lists:reverse/1 when the result is needed in the original form
% since it is greatly optimized

List ++ [H]

%the previous code has poor performance, you should use the reverse technique went this is found.
%but it is clearer, so if no improvement is needed this approach is recommended for clarity.