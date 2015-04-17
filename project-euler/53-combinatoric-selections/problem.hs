factorial :: Integer -> Integer
factorial n = product [1..n]

combination n r = (factorial n) `div` ( (factorial r) * (factorial (n-r)) )
combinationsFor n = map (combination n) [1..n]
allCombinations = [1..100] >>= combinationsFor

main = do
  print $ length $ filter (> 1000000) allCombinations
