module Test where

import qualified Frequencies
import Test.Hspec
import Test.QuickCheck

genPos :: Gen Int
genPos = abs `fmap` (arbitrary :: Gen Int) `suchThat` (> 0)

genListOfPos :: Gen [Int]
genListOfPos = listOf genPos

runTests :: IO ()
runTests =
  hspec $ do
    describe "Day 1 of Advent of code" $ do
      it "should get the sum of a list of Int" $ do
        Frequencies.calculateFrequency [0, 1, 2] `shouldBe` 3

runPropTests :: IO ()
runPropTests = do
  quickCheck $
    forAll genListOfPos $ \pos -> Frequencies.calculateFrequency pos >= 0
