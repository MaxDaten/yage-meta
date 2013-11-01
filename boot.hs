#!/usr/bin/env runhaskell
import System.Environment
import System.Process
import System.Directory
import System.FilePath
import System.Exit
import Control.Applicative
import Control.Monad

cabal :: String
cabal = "cabal"
-- git   = "git"

sandboxDir, sandboxModules :: FilePath
sandboxDir      = "." </> ".sandbox"
sandboxModules  = "." </> ".sandbox-modules"


targets :: [String] -> IO ExitCode
targets ("sandbox":xs) = doSandbox xs  
targets []             = error "no arguments"
targets xs             = error $ "invalid arguments: " ++ unwords xs


doSandbox :: [String] -> IO ExitCode
doSandbox ("init"   : [])      = initGlobalSandbox sandboxDir
doSandbox ("init"   : dir : _) = initGlobalSandbox dir
doSandbox ("delete" : [])      = removeGlobalSandbox sandboxDir
doSandbox ("delete" : dir : _) = removeGlobalSandbox dir
doSandbox _                 = error "no sandbox command given"


initGlobalSandbox :: FilePath -> IO ExitCode
initGlobalSandbox sdir = do
    createDirectoryIfMissing True sdir
    sandboxAbsoluteDir <- toAbs sdir
    modulesAbs         <- mapM toAbs =<< lines <$> readFile sandboxModules
    
    inDirectory sdir (initSandbox >> mapM addModuleSource modulesAbs)

    minimum <$> mapM (`inDirectory` linkSandbox sandboxAbsoluteDir) modulesAbs
    where
        initSandbox               = rawSystem cabal ["sandbox", "init", "--sandbox", "."]
        linkSandbox globalSandbox = rawSystem cabal ["sandbox", "init", "--sandbox", globalSandbox]
        toAbs dir                 = canonicalizePath =<< liftM2 combine getCurrentDirectory (makeRelativeToCurrentDirectory dir)
        addModuleSource modDir    = rawSystem cabal ["sandbox", "add-source", modDir]


removeGlobalSandbox :: FilePath -> IO ExitCode
removeGlobalSandbox sdir = do
    modules <- lines <$> readFile sandboxModules
    code    <- minimum <$> mapM (`inDirectory` unlinkSandbox) modules
    
    inDirectory sdir removeSandbox
    removeDirectoryRecursive sdir
    return code
    where
        removeSandbox = rawSystem cabal ["sandbox", "delete", "--sandbox", "."]
        unlinkSandbox = rawSystem cabal ["sandbox", "delete"]

inDirectory :: FilePath -> IO a -> IO a
inDirectory dir action = do
    old <- getCurrentDirectory
    setCurrentDirectory dir
    r   <- action
    setCurrentDirectory old
    return r

main :: IO ExitCode
main = do
    args <- getArgs
    exitWith =<< targets args