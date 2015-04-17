-module(accumulate).
-export([accumulate/2]).

accumulate(_,[]) -> [];
accumulate(Fn,[H|T]) -> [Fn(H)|accumulate(Fn,T)].
