-module(dna).
-export([hamming_distance/2]).

hamming_distance(As,Bs) -> 
  lists:foldl(
    fun({A, B},Acc) ->
        case A == B of
          true -> Acc;
          false -> Acc + 1
        end
    end, 0, lists:zip(As,Bs)
   ).    
