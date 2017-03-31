-module(atoms).
-export([show/0]).

show() ->
    %atoms are like enums or constants, there are global
    monday,
    %they start with a lowercase letter, followed by more letters an underscore or an at sign
    joe@somehost,
    %when you need atoms that start with uppercase letters or that contains non alphanumeric characters, surround with '
    'Monday',
    '*'.
    %giving an atom to the shell, will print out the same characters.