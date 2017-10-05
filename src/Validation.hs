module Validation where

import Test.QuickCheck hiding (Failure, Success)
import Data.Semigroup

data Validation a b =
  Failure a
  | Success b
  deriving ( Eq, Show )

instance (Semigroup a) => Semigroup (Validation a b) where
  Failure a <> Failure b = Failure (a <> b)
  _         <> Failure b = Failure b
  Failure a <> _         = Failure a
  b <> _                 = b

instance (Arbitrary a, Arbitrary b) => Arbitrary (Validation a b) where
  arbitrary = do
    a <- arbitrary
    b <- arbitrary
    elements[Failure a, Success b]

semigroupValidAssoc :: (Eq m, Semigroup m) => m -> m -> m -> Bool
semigroupValidAssoc a b c = (a <> (b <> c)) == ((a <> b) <> c)

type ValidationAssoc = Validation String Ordering -> Validation String Ordering
                        -> Validation String Ordering -> Bool
