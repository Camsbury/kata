module GB1.GroupByTest where

import Test.Prelude
import GB1.GroupBy
import Hedgehog.Gen as Gen
import Hedgehog.Range as Range



--------------------------------------------------------------------------------
-- Property Tests
--------------------------------------------------------------------------------

hprop_groupByWorksWithEq :: Property
hprop_groupByWorksWithEq = property $ do
  list <- forAll genListInt
  assert $ groupedCorrectly (==) (groupBy (==) list)

hprop_groupByWorksWithSameParity :: Property
hprop_groupByWorksWithSameParity = property $ do
  list <- forAll genListInt
  assert $ groupedCorrectly sameParity (groupBy sameParity list)



--------------------------------------------------------------------------------
-- Properties
--------------------------------------------------------------------------------

groupedCorrectly :: (a -> a -> Bool) -> [[a]] -> Bool
groupedCorrectly f = all (allMatch f)
  where
    allMatch _ []     = True
    allMatch f (x:xs) = all (f x) xs && allMatch f xs



--------------------------------------------------------------------------------
-- Generators
--------------------------------------------------------------------------------

genListInt :: Gen [Int]
genListInt = Gen.list (Range.linear 0 100) (Gen.int $ Range.linear (-10000) 10000)



--------------------------------------------------------------------------------
-- Helpers
--------------------------------------------------------------------------------

sameParity :: Integral a => a -> a -> Bool
sameParity a b
  | mod a 2 == 0 && mod b 2 == 0 = True
  | mod a 2 == 0 || mod b 2 == 0 = False
  | otherwise                 = True
