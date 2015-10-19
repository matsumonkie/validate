module Form.User
( userForm
, adultForm
) where

import Model.User
import Module.Form

userForm :: User -> Form User
userForm user =
  let
    form = mkForm user deals
    deals =
      mkDeal "firstname" presence (firstname user) :
      mkDeal "lastname" presence (lastname user) :
      mkDeal "age" (Coerce "positiveAge" (>= 0)) (age user) :
      []
  in form

adultForm :: User -> Form User
adultForm user =
  let
    form = mkForm user deals
    deals =
      mkDeal "age" (Coerce "adultAge" (>= 18)) (age user) :
      []
  in bind (userForm user) form
