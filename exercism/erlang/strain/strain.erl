-module(strain).
-export([keep/2, discard/2]).

keep(FN, Xs) -> [X || X <- Xs, FN(X)].
discard(FN, X) -> keep(fun(K) -> not FN(K) end, X).
