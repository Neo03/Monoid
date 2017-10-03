module BoolDisj
    (
      semigroupDisjAssoc
    , BoolDisjAssoc
    ) where

import Test.QuickCheck
import Data.Semigroup(Semigroup, (<>))

newtype BoolDisj = BoolDisj Bool deriving (Eq, Show)

instance Semigroup BoolDisj where
  (BoolDisj a) <> (BoolDisj b) = BoolDisj (a || b)

instance Arbitrary BoolDisj where
  arbitrary = do
    a <- arbitrary
    b <- arbitrary
    elements [BoolDisj a, BoolDisj b]

semigroupDisjAssoc :: (Eq m, Semigroup m) => m -> m -> m -> Bool
semigroupDisjAssoc a b c = (a <> (b <> c)) == ((a <> b) <> c)

type BoolDisjAssoc = BoolDisj -> BoolDisj -> BoolDisj -> Bool
