import FirstMappend
import Test.QuickCheck
import Trivial

main :: IO ()
main = do
  quickCheck (monoidAssoc :: FirstMappend)
  quickCheck (monoidLeftIdentity :: First' String -> Bool)
  quickCheck (monoidRightIdentity :: First' String -> Bool)
  quickCheck (semigroupAssoc :: TrivialAssoc)
