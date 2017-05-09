-module(chopstick_provider).
-export([start/2, loop/2]).

start(Node, Chopstick) ->
    spawn(Node, chopstick_provider, loop, [Chopstick, available]).

loop(Chopstick, available) ->
    receive
        {Philosopher, take} ->
            Philosopher ! {self(),Chopstick},
            loop(Chopstick, {Philosopher, taken})
    end;

loop(Chopstick, {Holder, taken}) ->
    receive
        {_Philosopher, return} ->
            loop(Chopstick, available);
        {Philosopher, take} ->
            Philosopher ! {self(), not_available},
            loop(Chopstick, {Holder, taken})
    end.