module Two where

import Test.QuickCheck
import Data.Semigroup(Semigroup, (<>))

data Two a b = Two a b deriving (Eq, Show)

instance (Semigroup a, Semigroup b) => Semigroup (Two a b) where
  (Two a b) <> (Two c d) = Two (a <> c) (b <> d)

instance (Arbitrary a, Arbitrary b) => Arbitrary (Two a b) where
  arbitrary = do
    a <- arbitrary
    b <- arbitrary
    return (Two a b)

semigroupTwoAssoc :: (Eq m, Semigroup m) => m -> m -> m -> Bool
semigroupTwoAssoc a b c = (a <> (b <> c)) == ((a <> b) <> c)

type TwoAssoc = Two String String -> Two String String -> Two String String -> Bool 
