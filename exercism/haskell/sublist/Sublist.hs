module Sublist where

data Sublist = Equal | Sublist | Superlist | Unequal deriving(Eq,Show)

sublist :: [a] -> [a] -> Sublist
sublist a b = compare a b Unequal where
  compare [] _ curr = curr
  compare _ [] curr = curr
  compare (a:as) (b:bs) curr = case (a,b,curr) of
