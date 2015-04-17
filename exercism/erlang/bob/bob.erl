-module(bob).
-export([response_for/1]).
-import(re,[run/2]).

% API
response_for(Q) -> Fn = silence(yelling(asking(default()))),
                   Fn(Q).

% Internal Use
yelling(Else) -> if_else(fun is_yelling/1, "Whoa, chill out!", Else).
asking(Else) -> if_else(fun is_asking/1, "Sure.", Else).
silence(Else) -> if_else(fun is_silence/1, "Fine. Be that way!", Else).
default() -> fun(_) -> "Whatever." end.

is_yelling(S) -> 
  (re:run(S,"\\p{Lu}") =/= nomatch) and 
  (re:run(S,"\\p{Ll}") =:= nomatch).

is_asking("?") -> true;
is_asking([_]) -> false;
is_asking([_|T]) -> is_asking(T).

is_silence([]) -> true;
is_silence(S) -> re:run(S,"^[\\s\\v\\h]*$",[unicode]) =/= nomatch.

% Returns a function that f(X):
if_else(T,If,Else) ->
  fun(X) ->
    case T(X) of
      true -> If;
      false -> Else(X)
    end
  end. 
