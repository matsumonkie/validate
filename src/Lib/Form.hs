{-# LANGUAGE DeriveDataTypeable #-}

module Lib.Form
( Form(..)
, mkForm
, valid
, invalid
, errors
) where

import Lib.Deal
import Lib.Valid
import Data.Monoid
import Data.Typeable

data Form a =
  ValidForm
  | InvalidForm { deals :: [Deal] }
  deriving (Show, Typeable)

instance Valid (Form a) where
  valid ValidForm = True
  valid _ = False

instance Monoid (Form a) where
  mempty = ValidForm

  mappend ValidForm ValidForm = ValidForm
  mappend ValidForm f = f
  mappend f ValidForm = f
  mappend f1 f2 =
    InvalidForm ((deals f1) ++ (deals f2))

mkForm :: [Deal] -> Form a
mkForm deals =
  case invalidDeals of
    [] -> ValidForm
    _ -> InvalidForm invalidDeals
  where invalidDeals = filter invalid deals

errors :: Form a -> [Deal]
errors = deals
