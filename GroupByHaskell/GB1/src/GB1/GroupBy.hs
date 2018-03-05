-- | This module exposes 'groupBy', a function that takes a transitive predicate,
-- and groups elements of a list with it.
module GB1.GroupBy
  ( groupBy
  ) where

import Prelude

-- | 'groupBy' takes a transitive predicate, and applies it
-- to a list to return a list of serial matches
groupBy :: (a -> a -> Bool) -> [a] -> [[a]]
groupBy _ [] = []
groupBy f (x:xs) = groupHelp f x $ span (f x) xs
  where
    groupHelp f x (head, tail) = (x:head) : groupBy f tail
