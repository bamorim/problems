module DNA where

toRNA :: [Char] -> [Char]
toRNA s = map comp s
  where
    comp 'A' = 'U'
    comp 'C' = 'G'
    comp 'G' = 'C'
    comp 'T' = 'A'
    comp  _  = error "Invalid DNA aminoacid."
