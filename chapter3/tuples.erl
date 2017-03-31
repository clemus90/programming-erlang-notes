-module(tuples).
-export([show/0]).

show() ->
    %similar to struct in c, but anonymous, for example to define a point you could use
    P = {10, 45}.
    %fields have no names, is common practice to add an atom that describes the tuples
    {person, {name, joe}, {height, 1.82},
    {footsize, 42}, {eyecolour, brown}}.
    %trying to create a tuple with an undefined variable, will throw an error
    {true, Q, 23, Costs}.
    %prev code will fail because Q is unbound

    %To extract data from a tuple you need to use pattern matching using the = operator
    Point = {point, 10, 45}.
    {point, X, Y} = Point.
    %X is now bound to 10 and Y to 45
    %To ignore parts of the tuple we use underscore
    Person = {person,{name, joe,armstrong},{footsize,42}}
    {_,{_,Who,_},_} = Person
    %Who is now bound to joe, the undrescore is calld anonymous variable