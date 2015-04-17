import Data.Char (ord)

solveEq :: Floating a => Int -> a
solveEq n = ((sqrt delta)-1)/2 where
  delta = 1 + 8 * (fromIntegral n)

isInt :: RealFrac a => a -> Bool
isInt n = (floor n) == (ceiling n)

isTriangleNumber :: Int -> Bool
isTriangleNumber n = isInt $ solveEq n

chrIdx :: Char -> Int
chrIdx c = ord c - ord 'A' + 1

wordValue :: String -> Int
wordValue w = sum $ map chrIdx w

countTriangleWords :: [String] -> Int
countTriangleWords words = length $ filter isTriangleNumber $ map wordValue words

csWordsToList :: String -> [String]
csWordsToList str = read ("["++str++"]")::[String]

main = readFile "p042_words.txt" >>= (print.countTriangleWords.csWordsToList)
