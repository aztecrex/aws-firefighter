module Handler (handler, Context, Input, somethingInAWS) where

import Prelude(Unit, unit, pure, discard)
import Control.Monad.Eff(Eff)
import Control.Monad.Eff.Console (CONSOLE, log)

foreign import somethingInAWS :: Eff (console :: CONSOLE) Unit

foreign import data Context :: Type
foreign import data Input :: Type

handler ::
  Input
  -> Context
  -> Eff (console :: CONSOLE) Unit
handler _ _ = do
  somethingInAWS
  log "everything is handled"
  pure unit

