module Or where

import Test.QuickCheck
import Data.Semigroup(Semigroup, (<>))
--import Data.Monoid 

data Or a b = Fst a | Snd b  deriving (Eq, Show)


instance (Semigroup a, Semigroup b) => Semigroup (Or a b) where
  (Snd a) <> _ = Snd a
  _ <> (Snd a) = Snd a
  _ <> b = b


instance (Arbitrary a, Arbitrary b) => Arbitrary (Or a b) where
  arbitrary = do
    a <- arbitrary
    b <- arbitrary
    elements [(Fst a), (Snd b)]

semigroupOrAssoc :: (Eq m, Semigroup m) => m -> m -> m -> Bool
semigroupOrAssoc a b c = (a <> (b <> c)) == ((a <> b) <> c)

type OrAssoc = Or String Ordering -> Or String Ordering -> Or String Ordering -> Bool
