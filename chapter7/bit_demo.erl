-module(bit_demo).
-export([test/0]).

test() ->
    M = <<X:3, Y:7, Z:6>>,
    %Creates a sequence with the contents of X, Y, Z assiging the number
    %of bits specified after the colon.
    %since the values above sum up to 16, the resulting value is a binary
    M = <<X:2, Y:7, Z:6>>,
    %for the last case since, the value is not divisible by 8, the value is a
    %bitstring

    %pattern matching with binary
    Red = 2,
    Green = 61,
    Blue = 20,
    Mem = <<Red:5, Green:6, Blue:5>>,
    %<<23,180>>
    <<R1:5, G1:6, B1:5>> = Mem,
    %last line shows how to extract the binary data

    % Bit Syntax
    % <<>>
    % <<E1, E2, ..., En>>

    %Element Syntax
    % Value
    % Value: Size
    %Value/TypeSpecifierList
    %Value:Size/TypeSpecifierList

    %If the total number of bits is divisible by eight, a binary gets constructed
    %otherwise a bitstring is constructed.

    %TypeSpecifierList is composed by End-Sign-Type-Unit
    % in any order, everyone is optional

    %End => big | little | native : Defines the endianness in memory
    Endianness = {<<16#12345678:32/big>>, <<16#12345678:32/little>>, <<16#12345678:32/native>>, <<16#12345678:32>>},
    % {<<18,52,86,120>>, <<120,86,52,18>>, <<120,86,52,18>>, <<18,52,86,120>>}

    %Sign => signed | unsigned : By default is unsigned

    %Type => integer | float | binary | bytes | bitstring | bits | utf8 | utf16 | utf32 : default is integer

    %Unit => unit:1 | 2 | ... 256: default 1 for integer, float, bitstring, 8 for binary, for the rest of the types
    % no unit is required

    
