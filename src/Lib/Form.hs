module Lib.Form
( Form(..)
, mkForm
) where

import Lib.Deal

data Form =
  ValidForm |
  InvalidForm {
    model :: String
  , invalidDeals :: [Deal]
  } deriving Show

mkForm :: String -> [Deal] -> Form
mkForm model deals =
  let invalidDeals = filter (not . isValidDeal) deals
  in
    if length invalidDeals > 0 then
      InvalidForm model $ invalidDeals
    else
      ValidForm
