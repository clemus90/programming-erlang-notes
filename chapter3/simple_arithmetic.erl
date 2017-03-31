-module(simple_arithmetic).
-export([show/0]).

show() ->
    % simple operations
    2 + 3 * 4.
    % large calculations
    123456789 * 987654321 * 112233445566778899 * 998877665544332211.
    % change of base
    16#cafe * 32#sugar.