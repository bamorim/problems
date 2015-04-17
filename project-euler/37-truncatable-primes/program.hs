import Data.List (unfoldr)
import Data.Maybe (listToMaybe)
 
factors n = unfoldr (\(d,n) -> listToMaybe [(x, (x, div n x)) | n > 1, x <- [d..isqrt n] ++ [n], rem n x == 0]) (2,n)
is_prime n = n > 1 && factors n == [n]
isqrt n = floor . sqrt . fromIntegral $ n

primes :: [Integer]
primes = sieve [2..]
  where
    sieve (p:xs) = p : sieve [x|x <- xs, x `mod` p > 0]

truncations :: (String -> String) -> String -> [String]
truncations f x = 
  if (length fx) > 0 
    then fx:(truncations f fx) 
    else []
  where fx = (f x)

left_truncations :: String -> [String]
left_truncations = truncations (drop 1)

right_truncations :: String -> [String]
right_truncations = truncations (\x -> take ((length x)-1) x)

all_truncations :: String -> [String]
all_truncations x = concat $ [[x], (right_truncations x), (left_truncations x)]

is_truncatable_prime :: Integer -> Bool
is_truncatable_prime n = (is_prime n) && (n > 10) && ( all is_prime $ map read $ all_truncations $ show n )


main = do
  print $ primes !! 100000
  print $ is_prime 100000
  print $ is_prime 99999
  print $ primes !! 2000
  print $ all_truncations "3797"
  print $ is_truncatable_prime 3
  print $ take 11 $ filter is_truncatable_prime primes
  -- print $ take 11 $ filter isTruncatablePrime primes
