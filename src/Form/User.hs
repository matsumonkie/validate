module Form.User
( adultForm
) where

import Model.User
import Module.Form

adultForm :: User -> Form
adultForm user =
  let
    form = mkForm "user" deals
    deals =
      mkDeal "firstname" present (firstname user) :
      mkDeal "lastname" present (lastname user) :
      mkDeal "age" (Coerce "adultAge" (>= 18)) (age user) :
      []
  in form
