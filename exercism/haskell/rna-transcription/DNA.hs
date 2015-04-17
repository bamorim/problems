module DNA where

toRNA :: [Char] -> [Char]
toRNA [] = []
toRNA seq = map comp seq
  where
    comp 'A' = 'U'
    comp 'C' = 'G'
    comp 'G' = 'C'
    comp 'T' = 'A'
    comp  _  = error "Invalid DNA aminoacid."
