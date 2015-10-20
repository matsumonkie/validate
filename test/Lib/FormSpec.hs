module Lib.FormSpec (main, spec) where

import Test.Hspec
import Model.User
import Form.User
import Lib.Form
import Lib.Deal

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

  describe "multiple binded forms" $ do

    it "validate" $ do
      let user = User { firstname = "John", lastname = "Doe", age = 18 }
      let form = adultUserForm user
      shouldSatisfy form valid

    it "invalidate" $ do
      let user = User { firstname = "John", lastname = "", age = 17 }
      let form = adultUserForm user

      shouldSatisfy form invalid
      shouldBe (length $ errors form) 2
      let error1 = constraint $ (errors form) !! 0
      shouldBe error1 "presence"
      let error2 = constraint $ (errors form) !! 1
      shouldBe error2 "adultAge"
