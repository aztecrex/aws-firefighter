module Main where

import Prelude (Unit)
import Control.Monad.Eff (Eff)
import Control.Monad.Eff.Exception (EXCEPTION)
import Control.Monad.Eff.Console (CONSOLE)

import Handler (runHandler, AWS)

main :: Eff ( exception :: EXCEPTION, aws :: AWS, console :: CONSOLE) Unit
main = runHandler
