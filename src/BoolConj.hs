module BoolConj
    ( BoolConjAssoc, semigroupBoolConjAssoc
    ) where

import Test.QuickCheck
import Data.Semigroup(Semigroup, (<>))


newtype BoolConj = BoolConj Bool deriving (Eq, Show)

instance Semigroup BoolConj where
  ( BoolConj a ) <> (BoolConj b) = BoolConj (a && b)

instance Arbitrary BoolConj where
  arbitrary = do
            a <- arbitrary
            b <- arbitrary
            elements [BoolConj a, BoolConj b]

semigroupBoolConjAssoc :: (Eq m, Semigroup m) => m -> m -> m -> Bool
semigroupBoolConjAssoc a b c = (a <> (b <> c)) == ((a <> b) <> c)

type BoolConjAssoc = BoolConj -> BoolConj -> BoolConj -> Bool
