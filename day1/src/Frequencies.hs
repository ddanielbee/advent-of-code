module Frequencies where

import qualified TestData

sumInt :: Int -> Int -> Int
sumInt a b = a + b

calculateFrequency :: [Int] -> Int
calculateFrequency frequencies = foldl sumInt 0 frequencies

main = do
  print $ calculateFrequency TestData.testData
