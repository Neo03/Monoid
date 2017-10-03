module Comp where


import Test.QuickCheck
import Data.Semigroup

newtype Comp a = Comp {unComp :: a -> a} 

instance Semigroup a => Semigroup (Comp a) where
  Comp {unComp=f} <> Comp {unComp=g} = Comp {unComp=f<>g}

instance Show(Comp a) where
  show _ = "Comp {unComp = <function>}"

instance (CoArbitrary a,Arbitrary a) => Arbitrary (Comp a) where
  arbitrary = do
    a <- arbitrary
    return (Comp a)

compAssoc :: Comp String -> Comp String -> Comp String -> String -> Bool
compAssoc a b c d = unComp (a <> (b <> c)) d  == unComp ((a <> b) <> c) d
