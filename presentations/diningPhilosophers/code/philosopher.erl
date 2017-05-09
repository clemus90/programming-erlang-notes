-module(philosopher).
-export([start/4, loop/3]).

start(Node, Philosopher, Provider1, Provider2) ->
    spawn(Node, philosopher, loop, [Philosopher, {Provider1, Provider2}, thinking]).

loop(Philosopher, Providers, thinking) ->
    io:format("~s, starts to think...", [Philosopher]),
    receive
        after rand:uniform(5000) ->
            loop(Philosopher, Providers, {hungry, none, none})
    end;

loop(Philosopher, {P1, P2}, {hungry, none, none}) ->
    io:format("~s, got hungry...", [Philosopher]),
    P1 ! {self(), take},
    receive
        {P1, not_available} ->
            loop(Philosopher, {P1, P2}, {hungry, none, none});
        {P1, Chopstick} ->
            loop(Philosopher, {P1, P2}, {hungry, Chopstick, none})
    end;
        

loop(Philosopher, {P1, P2}, {hungry, _Chop1, none}) ->
    io:format("~s, got First Chopstick, still hungry...", [Philosopher]),
    P2 ! {self(), take},
    receive
        {P2, not_available} ->
            P1 ! {self(), return},
            loop(Philosopher, {P1, P2}, {hungry, none, none});
        {P2, _Chopstick} ->
            loop(Philosopher, {P1, P2}, eating)
    end;

loop(Philosopher, {P1, P2}, eating) ->
    io:format("~s, starts to eat...", [Philosopher]),
    receive
        after rand:uniform(5000) ->
            P1 ! {self(), return},
            P2 ! {self(), return},
            loop(Philosopher, {P1, P2}, thinking)
    end.