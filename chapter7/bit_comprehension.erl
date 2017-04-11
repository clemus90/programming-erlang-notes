-module(bit_comprehension).
-export([test/0]).

test() ->
    B = <<16#5f>>,
    B1 = [X || <<X:1>> <= B],
    % [0,1,0,1,1,1,1,1]
    B2 = << <<X>> || <<X:1>> <= B >>,
    % << 0,1,0,1,1,1,1,1>>