module Lib.Valid
( Valid
, valid
, invalid
) where

class Valid a where
  valid :: a -> Bool
  valid a = (not . valid) a

  invalid :: a -> Bool
  invalid a = (not . valid) a
