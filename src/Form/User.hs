module Form.User
( userForm
, adultForm
, adultUserForm
) where

import Model.User
import Module.Form
import Data.Monoid

userForm :: User -> Form User
userForm model =
  mkForm [
    mkDeal "firstname" presence (firstname model)
  , mkDeal "lastname" presence (lastname model)
  , mkDeal "age" (Coerce "positiveAge" (>= 0)) (age model)
  ]

adultForm :: User -> Form User
adultForm model =
  mkForm [
    mkDeal "age" (Coerce "adultAge" (>= 18)) (age model)
  ]

adultUserForm :: User -> Form User
adultUserForm = userForm <> adultForm
