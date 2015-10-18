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
    case invalidDeals of
    [] -> ValidForm
    _ -> InvalidForm model $ invalidDeals

instance Eq Form where
  ValidForm == ValidForm = True
  InvalidForm _ _ == InvalidForm _ _ = True
  _ == _ = False
