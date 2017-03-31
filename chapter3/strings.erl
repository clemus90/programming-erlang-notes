-module(strings).
-export([show/1]).

show({first}) ->
    %Strings do not exists in Erlang formally, they are sequences of integers or binary
    %a string literal is represented by surrounding characters in "
    Name = "Hello",
    %this is a shorthand for the integers that represent each character
    %a list of ints will be printed as a string literal if every value represents a printable character
    Ej1 = [1,2,3],
    Ej2 = [83,117,114,112,114,105,115,101],
    %the first line will print [1,2,3], the second one will print "Surprise" in the shell
    %to know de integer representation of a character, you can prepend it with $, and the shell will print the integer val
    I = $s,
    %the expression above will bind I to the value 115.
    %each integer of the list represents a unicode character, to format it right you need to use the correct convention
    X = "a\x{221e}b",
    io:format("~ts~n",[X]),
    %the last line format the string to print the infinity symbol
    %to print a string as a list of integers, the format function needs to be used
    io:format("~w~n",["abc"]);
show({second}) -> ok.