module Lib.Form
( Form(..)
, mkForm
, bindForm
, valid
, invalid
, errors
) where

import Lib.Deal
import Lib.Valid

data Form a = Form {
  model :: a
, invalidDeals :: [Deal]
} deriving Show

instance Valid (Form a) where
  valid Form { invalidDeals = [] } = True
  valid _ = False

  invalid form = (not . valid) form

mkForm :: a -> [Deal] -> Form a
mkForm model deals =
  let invalidDeals = filter invalid deals
  in Form model invalidDeals

bindForm :: Form a -> Form a -> Form a
bindForm form1 form2 =
  let allInvalidDeals = (invalidDeals form1) ++ (invalidDeals form2)
  in mkForm (model form1) allInvalidDeals

errors :: Form a -> [Deal]
errors form = invalidDeals form
