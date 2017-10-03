module Three where

import Data.Semigroup(Semigroup, (<>))
import Test.QuickCheck

data Three a b c = Three a b c deriving (Eq, Show)

instance (Semigroup a, Semigroup b, Semigroup c) => Semigroup (Three a b c) where
  (Three a b c) <> (Three d e f) = Three ( a <> d ) ( b <> e ) (c <> f)

instance (Arbitrary a, Arbitrary b, Arbitrary c) => Arbitrary (Three a b c) where
   arbitrary = do
     a <- arbitrary
     b <- arbitrary
     c <- arbitrary
     return (Three a b c)

semigroupThreeAssoc :: (Eq m, Semigroup m) => m -> m -> m -> Bool
semigroupThreeAssoc a b c = ( a <> ( b <> c )) == (( a <> b ) <> c )

type ThreeAssoc = Three String String String
                -> Three String String String
                -> Three String String String
                -> Bool
