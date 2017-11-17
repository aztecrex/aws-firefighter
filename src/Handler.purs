module Handler (handler, Context, Input, runHandler, AWS, AssumedRole) where

import Prelude(Unit, unit, pure, discard, ($), bind, class Show, void)
import Control.Monad.Eff(Eff, kind Effect)
import Control.Monad.Eff.Exception(EXCEPTION, Error)
import Control.Monad.Aff(Aff, makeAff, launchAff, liftEff')
import Control.Monad.Eff.Console (CONSOLE, log, logShow)

foreign import data Context :: Type
foreign import data Input :: Type
foreign import data AssumedRole :: Type

foreign import _fakeContext :: Context
foreign import _fakeInput :: Input

foreign import _stringify :: forall a. a -> String

instance showAssumedRole :: Show AssumedRole where
  show = _stringify

foreign import _firefighterRole :: String

foreign import data AWS :: Effect

foreign import _assumeRole ::
  forall eff effA effB.
      String
  ->  String
  ->  (Error -> Eff effA Unit)
  ->  (AssumedRole -> Eff effB Unit)
  ->  Eff (aws :: AWS | eff) Unit

assumeRole :: forall eff. String -> String -> Aff (aws :: AWS | eff) AssumedRole
assumeRole role session = makeAff $ _assumeRole role session

handler :: forall eff.
     Input
  -> Context
  -> (AssumedRole -> Eff (exception :: EXCEPTION, aws :: AWS, console :: CONSOLE | eff) Unit)
  -> Eff (exception :: EXCEPTION, aws :: AWS, console :: CONSOLE | eff) Unit
handler _ ctx cb = void $ launchAff $ do
  assumed <- assumeRole _firefighterRole "fight-fire-with-fire"
  void $ liftEff' $ cb assumed
  -- void $ liftEff' $ logShow assumed
  void $ liftEff' $ log "everything is handled"
  pure unit

runHandler :: Eff ( exception :: EXCEPTION, aws :: AWS, console :: CONSOLE) Unit
runHandler = handler _fakeInput _fakeContext logShow
