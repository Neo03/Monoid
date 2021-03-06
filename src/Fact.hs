module Fact where

import Data.Monoid
import Data.Foldable
import Control.Monad.Writer
import Control.Monad.State

fact1 :: Integer -> Writer String Integer
fact1 0 = return 1
fact1 n = do
  let n' = n-1
  tell $ "We've taken one away from " ++ show n ++ "\n"
  m <- fact1 n'
  tell $ "We've called f " ++ show m ++ "\n"
  let r = n * m
  tell $ "We've multiplied " ++ show n ++ " and " ++ show m ++ "\n"
  return r

ex1 = runWriter (fact1 10)

fact2 :: Integer -> Writer (Sum Integer) Integer
fact2 0 = return 1
fact2 n = do
  let n' = n-1
  tell $ Sum 1
  m <- fact2 n'
  let r = n * m
  tell $ Sum 1
  return r
ex2 = runWriter (fact2 10)

fact5 :: Integer -> Writer (Dual String) Integer
fact5 0 = return 1
fact5 n = do
  let n' = n-1
  tell $ Dual $ "We've taken one away from " ++ show n ++ " " ++ "\n"
  m <- fact5 n'
  tell $ Dual $ "We've called f " ++ show m ++ "\n"
  let r = n * m
  tell $ Dual $ "We've multiplied " ++ show n ++ " and " ++ show m ++ " " ++ "\n"
  return r
ex5 = runWriter (fact5 10)

data Tree a = Empty | Leaf a | Node (Tree a) a (Tree a) deriving (Eq, Show)

instance Foldable Tree where
  foldMap f Empty = mempty
  foldMap f (Leaf x) = f x
  foldMap f (Node l k r) = foldMap f l
                           `mappend` f k
                           `mappend` foldMap f r

tree = Node (Leaf 1) 7 (Leaf 2)
ex7 = foldMap (Any . (== 1)) tree
ex8 = foldMap (All . (> 5)) tree
