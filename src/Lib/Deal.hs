module Lib.Deal
( Deal(..)
, mkDeal
, valid
, invalid
) where

import Lib.Coerce
import Lib.Valid

data Deal =
  ValidDeal |
  InvalidDeal {
    attribute :: String
  , constraint :: String
  , value :: String
  } deriving Show

instance Valid Deal where
  valid ValidDeal = True
  valid _ = False

mkDeal :: (Show a) => String -> Coerce a -> a -> Deal
mkDeal attribute (Coerce k v) value =
  if v value then
    ValidDeal
  else
    InvalidDeal attribute k (show value)
