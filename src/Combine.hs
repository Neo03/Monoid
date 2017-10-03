module Combine where

import Test.QuickCheck
import Data.Semigroup as S

newtype Combine a b = Combine { unCombine :: (a -> b) }

instance S.Semigroup b => S.Semigroup (Combine a b) where
   Combine{unCombine=f} <> Combine{unCombine=g} = Combine{unCombine= \x -> (f x) S.<> (g x)  }

instance Show (Combine a b) where
    show _ = "Combine { unCombine = <function> }"

instance (CoArbitrary a, Arbitrary b) => Arbitrary (Combine a b)  where
  arbitrary = do
      f <- arbitrary
      return (Combine f )

combineAssoc :: Combine Int String -> Combine Int String -> Combine Int String -> Int -> Bool
combineAssoc a b c d = unCombine ( (a S.<> (b S.<> c))) d == unCombine ((a S.<> b) S.<> c) d
