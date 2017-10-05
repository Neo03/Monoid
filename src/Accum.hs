module Accum where

import Test.QuickCheck hiding (Failure, Success)
import Data.Semigroup

data Validation a b = Failure a | Success b deriving (Eq, Show)
newtype AccumulateRight a b = AccumulateRight (Validation a b) deriving (Eq, Show)

instance (Semigroup a, Semigroup b) => Semigroup (AccumulateRight a b) where
  AccumulateRight (Success a) <> AccumulateRight (Success b) = AccumulateRight(Success (a <> b))
  _                           <> AccumulateRight (Failure a) = AccumulateRight(Failure a)
  AccumulateRight (Failure a) <> _                           = AccumulateRight(Failure a)

instance (Arbitrary a, Arbitrary b) => Arbitrary (AccumulateRight a b) where
  arbitrary = do
    a <- arbitrary
    b <- arbitrary
    elements[AccumulateRight(Failure a), AccumulateRight(Success b)]

semigroupAccumAssoc :: (Eq m, Semigroup m) => m -> m -> m -> Bool
semigroupAccumAssoc a b c = (a <> (b <> c)) == ((a <> b) <> c)

type AccumAssoc = AccumulateRight String Ordering -> AccumulateRight String Ordering -> AccumulateRight String Ordering -> Bool
