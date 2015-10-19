module Lib.FormSpec (main, spec) where

import Test.Hspec
import Model.User
import Form.User
import Lib.Form

main :: IO ()
main = hspec spec

spec :: Spec
spec = do

  describe "simple model" $ do

    it "validate" $ do
      let user = User { firstname = "John", lastname = "Doe", age = 12 }
      let form = userForm user
      shouldSatisfy form valid

    it "invalidate" $ do
      let user = User { firstname = "John", lastname = "Doe", age = -1 }
      let form = userForm user
      shouldSatisfy form invalid
