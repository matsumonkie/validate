module Lib.Coerce
( Coerce(..)
, presence
, positive
) where

data Coerce a = Coerce String (a -> Bool)

presence = Coerce "presence" (\x -> (not . null) x)

positive :: (Integral a) => Coerce a
positive = Coerce "positive" (> 0)
