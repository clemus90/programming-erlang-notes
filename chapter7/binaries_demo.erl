-module(binaries_demo).
-export([test/0]).

test() ->
    %binaries are sequences written between <<..>>
    %binaries are suited for large amount of data, represented as
    %bits, divisible by 8, so each space fits a byte.
    Bin1 = <<5,10,20>>,
    % <<5,10,20>>, to be consistent with the by 8 divisibility in terms of space
    % each integer should be in the range of 0 to 255
    Bin2 = <<"hello">>,
    % <<"hello">>
    Bin3 = <<65,66,67>>,
    % <<"ABC">> just like sequences of integers, if each number is a 
    % printable character, the value gets printed as a string
    

    %BIFs to manipulate binares
    Bin4 = list_to_binary([Bin1, 1, [2,3,Bin2],4|Bin3]),
    % <<5,10,20,1,2,3,104,101,108,108,111,4,65,66,67>>
    Sp = split_binary(Bin4, 2),
    % {<<5,10,20>>,<<1,2,3,104,101,108,108,111,4,65,66,67>>}
    TermExample = term_to_binary({binaries, "are", useful}).
    % <<131,104,3,100,0,8,98,105,110,97,114,105,101,115,107,0,3,97,114,101,100,0,6,117,115,101,102,117,108>>
    Reverse = term_to_binary(TermExample)
    % {binaries, "are", useful}
    %the last two bifs allows storage of terms in files, and passing terms through the network.

    %byte_size gets the number of bytes of a binary