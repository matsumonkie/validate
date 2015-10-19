module Lib.Form
( Form(..)
, mkForm
, valid
, invalid
) where

import Lib.Deal
import Lib.Valid

data Form a = Form {
  model :: a
, invalidDeals :: [Deal]
} deriving Show

mkForm :: a -> [Deal] -> Form a
mkForm model deals =
  let invalidDeals = filter invalid deals
  in Form model invalidDeals

instance Valid (Form a) where
  valid Form { invalidDeals = [] } = True
  valid _ = False

  invalid form = (not . valid) form
