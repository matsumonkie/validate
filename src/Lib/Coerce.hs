module Lib.Coerce
( Coerce(..)
, present
, positive
) where

data Coerce a = Coerce String (a -> Bool)

present = Coerce "present" (\x -> length(x) > 0)

positive :: (Integral a) => Coerce a
positive = Coerce "positive" (> 0)
