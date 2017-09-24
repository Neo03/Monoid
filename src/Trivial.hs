module Trivial where

import Test.QuickCheck(Arbitrary, arbitrary, quickCheck)
import Data.Semigroup(Semigroup,(<>))

data Trivial = Trivial deriving (Eq, Show)

instance Semigroup Trivial where
  _ <> _ = undefined

instance Arbitrary Trivial where
  arbitrary = return  Trivial
