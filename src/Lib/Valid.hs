module Lib.Valid
( Valid
, valid
, invalid
) where

class Valid a where
  valid :: a -> Bool
  valid a = (not . invalid) a

invalid :: (Valid a) => a -> Bool
invalid a = (not . valid) a
