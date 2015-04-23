import Control.Monad
reverseComplement :: String -> String
reverseComplement s = reverse $ map comp s where
  comp 'A' = 'T'
  comp 'C' = 'G'
  comp 'G' = 'C'
  comp 'T' = 'A'
  comp  _  = '\0'


main :: IO ()
main = getContents >>= putStr.unlines.(map reverseComplement).lines
