module Lib.Valid
( Valid
, valid
, invalid
) where

class Valid a where
  valid :: a -> Bool
  invalid :: a -> Bool
