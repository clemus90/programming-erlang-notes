-module(maps_demo).
-export([test/0, count_characters/1]).

test() ->
    % map sintax => #{Key1 Op Val1, Key2 Op Val2, ..., KeyN Op ValN}
    F1 = #{ a => 1, b => 2},
    % non atomic keys
    Facts = #{{wife, fred} => "Sue", {age, fred} => 45,
        {daughter,fred} => "Mary",
        {likes, jim} => [1]},
    % => and := are the two valid operators in the map assignment
    % => is used to update or add a value to a map, always is successful
    % := is solely used to update, if it is tried on a nonexisted record it fails
    F3 = F1#{c => xx},
    % Updates the value assosiated with c in the map F1 or add it if not existent.
    F4 = F3#{c => 3}.
    %Updates the value assosiated with c in the map F3, if it doesn't exists, it fails.

count_characters(Str) ->
    count_characters(Str, #{}).

count_characters([H|T], X) ->
    case X of #{H := N} ->
        count_characters(T, X#{ H := N + 1 });
    _ ->
        count_characters(T, X#{H => 1})
    end;

count_characters([], X) ->
    X.

%Ordering of maps
