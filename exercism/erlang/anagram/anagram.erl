-module(anagram).
-export([find/2]).

find(Input, Candidates) -> 
  InputCount = charCount(string:to_lower(Input)),
  [X || X <- Candidates,
        charCount(string:to_lower(X)) == InputCount,
        string:to_lower(X) /= string:to_lower(Input)].

charCount(Input) ->
  lists:foldl(fun(C,Acc) -> maps:put(C, maps:get(C, Acc, 0)+1, Acc) end, #{}, Input).
