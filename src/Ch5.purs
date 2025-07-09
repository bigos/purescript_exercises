module Ch5 where

import Prelude (Unit, show, const)
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
flip f x = \y  -> f y x
--  the above is example of alternative syntaxes with moving parameters avross te =

test :: Effect Unit
test =  log (show (flip const 1 2))
