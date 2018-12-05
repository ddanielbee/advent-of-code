module Frequencies where

import qualified TestData

sumInt :: Int -> Int -> Int
sumInt a b = a + b

calculateFrequency :: [Int] -> Int
calculateFrequency frequencies = foldl sumInt 0 frequencies

findFirstDuplicateFrequency :: [Int] -> [Int] -> Int
findFirstDuplicateFrequency accumulator frequencies = fn accumulator frequencies
  where
    fn [] [] = 0
    fn [] freqs = fn [0] freqs
    fn acc [] = findFirstDuplicateFrequency acc frequencies
    fn acc freqs@(b:bs)
      | elem (last acc + b) acc == False = fn (acc ++ [(last acc + b)]) bs
      | elem (last acc + b) acc == True = last acc + b

main = do
  print $ calculateFrequency TestData.testData
  print $ findFirstDuplicateFrequency [] TestData.testData
