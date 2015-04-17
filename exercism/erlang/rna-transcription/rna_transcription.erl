-module(rna_transcription).
-export([to_rna/1]).

to_rna(Str) -> lists:map(fun c_rna/1,Str).

c_rna(Char) ->
  case Char of
    $G -> $C;
    $C -> $G;
    $A -> $U;
    $T -> $A
  end.
