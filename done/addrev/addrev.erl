-module (addrev).
-export ([main/0]).

main() ->
    {ok, [Iterations]} = io:fread("", "~d"),
    io:fwrite("~s~n", [addrev(0, Iterations, [])]).

addrev(Current, Iterations, PartialResult) when Current =:= Iterations -> string:join(lists:reverse(PartialResult), "\n");
addrev(Current, Iterations, PartialResult) ->
    % Read
    {ok, [FirstString, SecondString]} = io:fread("", "~s ~s"),
    % Reverse
    FirstStringReversed = lists:reverse(FirstString),
    SecondStringReversed = lists:reverse(SecondString),
    % Sum
    {FirstNumber, _}  = string:to_integer(FirstStringReversed),
    {SecondNumber, _} = string:to_integer(SecondStringReversed),
    SumNumber =  FirstNumber + SecondNumber,
    % Reverse the sum
    SumString = integer_to_list(SumNumber),
    ReversedSum = lists:reverse(SumString),
    % Converting from string to integer makes it unecessary to check for leading zeros.
    {Result, _} = string:to_integer(ReversedSum),
    % Loop
    addrev(Current + 1, Iterations, [integer_to_list(Result)|PartialResult]).
