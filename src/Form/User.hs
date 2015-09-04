module Form.User
( form
) where

import Model.User
import Module.Form

form :: User -> Form
form user =
  let
    form = mkForm "user" deals
    deals =
      mkDeal "age" positive (age user) :
      mkDeal "age" (Coerce "equal5" (== 5)) (age user) :
      mkDeal "firstname" present (firstname user) :
      []
  in form
