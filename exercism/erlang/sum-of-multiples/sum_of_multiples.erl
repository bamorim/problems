-module(sum_of_multiples).
-export([sumOfMultiples/2, sumOfMultiplesDefault/1]).

sumOfMultiplesDefault(N) -> sumOfMultiples([3, 5],N).
sumOfMultiples(Mult,N) -> sumOfMultiples(Mult,N-1,0).

sumOfMultiples(_,X,Sum) when X =< 0 -> Sum;
sumOfMultiples(Mult,N,Sum) ->
  case isMultipleOf(Mult,N) of
    true -> sumOfMultiples(Mult, N-1, Sum+N);
    false -> sumOfMultiples(Mult, N-1, Sum)
  end.

isMultipleOf(Mult,N) ->
  lists:any(fun(X) -> N rem X == 0 end, Mult).
