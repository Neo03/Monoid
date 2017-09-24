module FirstMappend where

import Data.Monoid
import Test.QuickCheck

data Optional a =
    Nada
  | Only a
  deriving (Eq, Show)

monoidAssoc :: (Eq m, Monoid m) => m -> m -> m -> Bool
monoidAssoc a b c = a <> (b <> c) == (a <> b) <> c

monoidLeftIdentity :: (Eq m, Monoid m) => m -> Bool
monoidLeftIdentity m = m <> mempty == m

monoidRightIdentity :: (Eq m, Monoid m) => m -> Bool
monoidRightIdentity m = mempty <> m == m

newtype First' a =
  First' { getFirst' :: Optional a }
  deriving (Eq, Show)

instance Arbitrary a => Arbitrary ( First' a) where
  arbitrary = do
    x <- arbitrary
    frequency [(1, return (First' Nada)),(1, return (First'(Only x)))]


instance Monoid (First' a) where
  mempty                                   = First' Nada
  mappend (First' Nada) (First'(Only x))   = First' (Only x)
  mappend (First' (Only x)) _              = First' (Only x)
  mappend _ _                              = First' Nada

firstMappend :: First' a -> First' a -> First' a
firstMappend = mappend

type FirstMappend =
     First' String
  -> First' String
  -> First' String
  -> Bool
