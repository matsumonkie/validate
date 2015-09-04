module Lib.Deal
( Deal(..)
, mkDeal
, isValidDeal
) where

import Lib.Coerce

data Deal =
  ValidDeal |
  InvalidDeal {
    attribute :: String
  , constraint :: String
  , value :: String
  } deriving Show

mkDeal :: (Show a) => String -> Coerce a -> a -> Deal
mkDeal attribute (Coerce k v) value =
  if v value then
    ValidDeal
  else
    InvalidDeal attribute k (show value)

isValidDeal :: Deal -> Bool
isValidDeal ValidDeal = True
isValidDeal _ = False
