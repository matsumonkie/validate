module Lib.Coerce
( Coerce(..)
, presence
, positive
) where

data Coerce a = Coerce String (a -> Bool)

presence = Coerce "presence" (not . null)

positive :: (Integral a) => Coerce a
positive = Coerce "positive" (> 0)
