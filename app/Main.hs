module Main where

import Lib
import Combine
import Data.Semigroup(Semigroup, (<>), Sum(Sum, getSum))



f = Combine $ \n -> Sum (n + 1)
g = Combine $ \n -> Sum (n - 1)

main :: IO ()
main = do
  print $ unCombine (f <> g) $ 0
  print $ unCombine (f <> g) $ 1
  print $ unCombine (f <> f) $ 1
