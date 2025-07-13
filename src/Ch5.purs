module Ch5 where

import Prelude (Unit, show, discard)

-- search Pursuit for Data.List
-- https://pursuit.purescript.org/packages/purescript-lists/7.0.0
-- install in terminal: spago install lists
-- from Data.List import type List and all constructors and (:) cons operator
import Data.List (List(..), (:))

import Effect (Effect)
import Effect.Console (log)

-- the last parentheses are implied
-- these type signatures are equivalent
flip :: ∀ a b c. (a -> b -> c) -> (b -> a -> c)
-- flip :: ∀ a b c. (a -> b -> c) -> b -> (a -> c)
-- flip :: ∀ a b c. (a -> b -> c) -> b -> a -> c
--
-- flip f x y = f y x
-- flip f = \x y -> f y x
flip f x = \y -> f y x

--  the above is example of alternative syntaxes with moving parameters avross te =

-- const
const :: forall a b. (a -> b -> a)
const x _ = x

apply :: forall a b. (a -> b) -> a -> b
apply f x = f x

infixr 0 apply as $

applyFlipped :: forall a b. a -> (a -> b) -> b
applyFlipped x f = f x

infixl 1 applyFlipped as #

test :: Effect Unit
test = do
  log (show (flip const 1 2))
  log $ show $ flip const 1 2
  flip const 1 2 # show # log
