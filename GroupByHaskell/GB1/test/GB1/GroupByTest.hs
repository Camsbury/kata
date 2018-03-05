module GB1.GroupByTest where

import Test.Prelude
import GB1.GroupBy



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
groupedCorrectly = undefined



--------------------------------------------------------------------------------
-- Generators
--------------------------------------------------------------------------------

genListInt :: Gen [Int]
genListInt = undefined



--------------------------------------------------------------------------------
-- Helpers
--------------------------------------------------------------------------------

sameParity :: Integral a => a -> a -> Bool
sameParity = undefined
