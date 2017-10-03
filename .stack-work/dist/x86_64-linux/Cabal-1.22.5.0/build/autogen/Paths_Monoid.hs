module Paths_Monoid (
    version,
    getBinDir, getLibDir, getDataDir, getLibexecDir,
    getDataFileName, getSysconfDir
  ) where

import qualified Control.Exception as Exception
import Data.Version (Version(..))
import System.Environment (getEnv)
import Prelude

catchIO :: IO a -> (Exception.IOException -> IO a) -> IO a
catchIO = Exception.catch

version :: Version
version = Version [0,1,0,0] []
bindir, libdir, datadir, libexecdir, sysconfdir :: FilePath

bindir     = "/home/vasiliy/TestAll/Haskell/Monoid/.stack-work/install/x86_64-linux/lts-9.5/7.10.3/bin"
libdir     = "/home/vasiliy/TestAll/Haskell/Monoid/.stack-work/install/x86_64-linux/lts-9.5/7.10.3/lib/x86_64-linux-ghc-7.10.3/Monoid-0.1.0.0-36px53ZPhG84BimjxB5yeC"
datadir    = "/home/vasiliy/TestAll/Haskell/Monoid/.stack-work/install/x86_64-linux/lts-9.5/7.10.3/share/x86_64-linux-ghc-7.10.3/Monoid-0.1.0.0"
libexecdir = "/home/vasiliy/TestAll/Haskell/Monoid/.stack-work/install/x86_64-linux/lts-9.5/7.10.3/libexec"
sysconfdir = "/home/vasiliy/TestAll/Haskell/Monoid/.stack-work/install/x86_64-linux/lts-9.5/7.10.3/etc"

getBinDir, getLibDir, getDataDir, getLibexecDir, getSysconfDir :: IO FilePath
getBinDir = catchIO (getEnv "Monoid_bindir") (\_ -> return bindir)
getLibDir = catchIO (getEnv "Monoid_libdir") (\_ -> return libdir)
getDataDir = catchIO (getEnv "Monoid_datadir") (\_ -> return datadir)
getLibexecDir = catchIO (getEnv "Monoid_libexecdir") (\_ -> return libexecdir)
getSysconfDir = catchIO (getEnv "Monoid_sysconfdir") (\_ -> return sysconfdir)

getDataFileName :: FilePath -> IO FilePath
getDataFileName name = do
  dir <- getDataDir
  return (dir ++ "/" ++ name)
