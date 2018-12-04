module Lib where

import qualified TestData

sumInt :: Int -> Int -> Int
sumInt a b = a + b

result :: Int
result = foldl sumInt 0 TestData.testData

main = do
  print result
