module Ident where

import Data.Semigroup (Semigroup, (<>))
import Test.QuickCheck

newtype Identity a = Identity a deriving (Eq, Show)

instance Semigroup a => Semigroup (Identity a) where
  (Identity a) <> (Identity b) = Identity (a <> b)

instance Arbitrary a =>  Arbitrary (Identity a) where
  arbitrary = do
    a <- arbitrary
    return (Identity a)

semigroupIdentAssoc :: (Eq m, Semigroup m) => m -> m -> m -> Bool
semigroupIdentAssoc a b c = (a <> (b <> c)) == ((a <> b) <> c)


type IdentityAssoc = Identity String -> Identity String -> Identity String -> Bool
