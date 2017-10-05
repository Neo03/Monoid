import FirstMappend
import Test.QuickCheck
import Trivial
import Ident
import Two
import Three
import Four
import BoolConj
import BoolDisj
import Or
import Combine
import Comp
import Validation
import Accum
import Acboth

main :: IO ()
main = do
  quickCheck (monoidAssoc :: FirstMappend)
  quickCheck (monoidLeftIdentity :: First' String -> Bool)
  quickCheck (monoidRightIdentity :: First' String -> Bool)
  quickCheck (semigroupAssoc :: TrivialAssoc)
  quickCheck (semigroupIdentAssoc :: IdentityAssoc)
  quickCheck (semigroupTwoAssoc :: TwoAssoc)
  quickCheck (semigroupThreeAssoc :: ThreeAssoc)
  quickCheck (semigroupFourAssoc :: FourAssoc)
  quickCheck (semigroupBoolConjAssoc :: BoolConjAssoc)
  quickCheck (semigroupDisjAssoc :: BoolDisjAssoc)
  quickCheck (semigroupOrAssoc :: OrAssoc)
  quickCheck combineAssoc
  quickCheck compAssoc
  quickCheck (semigroupValidAssoc :: ValidationAssoc)
  quickCheck (semigroupAccumAssoc :: AccumAssoc)
  quickCheck (semigroupAcbothAssoc :: AcbothAssoc)
