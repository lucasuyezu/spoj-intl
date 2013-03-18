-module(tested).
-export([main/0]).
-export([test/1]).

main() ->
    {ok, [FirstNumber]} = io:fread("", "~d"),
    test(FirstNumber).

test(42) -> exit;
test(Number) ->
    io:fwrite("~p~n", [Number]),
    {ok, [NewNumber]} = io:fread("", "~d"),
    test(NewNumber).
