-module(grains).
-export([square/1, total/0]).

% The number of grains in square N is given
% by 2^(N-1), or the same as bitshifting 2
% by N-2
square(N) -> 2 bsl (N-2).

% The total number of grains is given by
% 2^64-1, or bitshifting 2 by 63 and
% subtracting one
total() -> (2 bsl 63) - 1.
