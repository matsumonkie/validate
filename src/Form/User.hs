module Form.User
( userForm
, adultForm
, adultUserForm
) where

import Model.User
import Module.Form

userForm :: User -> Form User
userForm model =
  mkForm model deals
  where
    deals = [
      mkDeal "firstname" presence (firstname model),
      mkDeal "lastname" presence (lastname model),
      mkDeal "age" (Coerce "positiveAge" (>= 0)) (age model)
      ]

adultForm :: User -> Form User
adultForm model =
  mkForm model deals
  where
    deals = [
      mkDeal "age" (Coerce "adultAge" (>= 18)) (age model)
      ]

adultUserForm :: User -> Form User
adultUserForm model =
  bindForms model [userForm, adultForm]
