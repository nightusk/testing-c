{-# LANGUAGE ForeignFunctionInterface #-}
module Main (main) where

import Data.Word (Word8, Word64)
import System.Exit (exitFailure, exitSuccess)

foreign import ccall "lib.h fibonacci"
  fibonacci :: Word8 -> Word64

main :: IO ()
main = do
  if fibonacci 5 == 8
    then do
      putStrLn "PASS"
      exitSuccess
    else do
      putStrLn "FAIL"
      exitFailure
