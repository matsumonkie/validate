module Lib.Form
( Form(..)
, mkForm
, bindForms
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

mkForm :: a -> [Deal] -> Form a
mkForm model deals =
  let invalidDeals = filter invalid deals
  in Form model invalidDeals

bindForms :: a -> [a -> Form a] -> Form a
bindForms model forms =
  mkForm model allInvalidDeals
  where
    allInvalidDeals = concat [invalidDeals (form model) | form <- forms]

errors :: Form a -> [Deal]
errors form = invalidDeals form
