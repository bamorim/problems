module Accumulate where

accumulate :: (a -> b) -> [a] -> [b]
accumulate _ [] = []
accumulate fn (x:xs) = (fn x):(accumulate fn xs)
