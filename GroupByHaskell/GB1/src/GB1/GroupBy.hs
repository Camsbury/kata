-- | This module exposes 'groupBy', a function that takes a transitive predicate,
-- and groups elements of a list with it.
module GB1.GroupBy
  ( groupBy
  ) where

import Prelude

groupBy :: (a -> a -> Bool) -> [a] -> [[a]]
groupBy = undefined
