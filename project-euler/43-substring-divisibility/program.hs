import Data.Char (intToDigit)

divisibleBy :: Int -> Int -> Bool
divisibleBy n m = n `mod` m == 0

next :: String -> [Char]
next str = if len > 2 && len < 10 then divsBy (primes !! (len - 3)) else availableDigits
  where 
    primes = [2,3,5,7,11,13,17]
    len = length str
    divsBy n = filter ((`divisibleBy` n).ds) availableDigits -- ensure last 3 digits is divisible per n
    availableDigits = filter (not.inc) $ map intToDigit [0..9] -- get a list of available digits to use
    inc d = any (== d) str
    ds c = read $ last_two_digits ++ [c]
    last_two_digits = (drop ((length str)-2) str)

options :: String -> [String]
options str = map (\c -> str ++ [c]) (next str)

numbers :: [Int]
numbers = map read $ deepOptions [""] 10 where
  deepOptions l 0 = l
  deepOptions l n = deepOptions (l >>= options) (n-1)

answer :: Int
answer = sum numbers

main = do
  print answer
