module Validation where

import Test.QuickCheck
import Data.Semigroup

data Validation a b =
  Failure a
  | Success b
  deriving ( Eq, Show )

   
