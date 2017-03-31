-module(lists).
-export([show/0]).

show() ->
    %to create a list you use the square brackets
    Drawing = [{square,{10,10},10}, {triangle, {15,10},{25,10},{30,40}}],
    %the individual elements can be of any type
    [1+7,hello,2-2,{cost,apple, 30-20},3],
    %List are formed by a head and a tail using the following form [H|T], a well formed list makes sure that T is a list
    ThingsToBuy = [{apples, 10},{pears, 6},{milk, 3}],
    ThingsToBuy1 = [{oranges,4}, {newspaper,1}|ThingsToBuy],
    %To extract elements from a list we use the | in the pattern match
    [Buy1|ThingsToBuy2] = ThingsToBuy1,
    %Buy1 will have the orange, and ThingsToBuy2 the list with head newspaper
    [Buy2, Buy3 | ThingsToBuy3] = ThingsToBuy2.
    %Same logic, first two values assigned to Buy2 and Buy3 respectively, the rest of the list gets stored in ThingstoBuy3