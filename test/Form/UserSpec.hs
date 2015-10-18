module Form.UserSpec (main, spec) where

import Test.Hspec
import Model.User
import Form.User
import Lib.Form

main :: IO ()
main = hspec spec

spec :: Spec
spec = do

  describe "validate" $ do

    it "adult" $ do
      let user = User {
        firstname = "John"
      , lastname = "Doe"
      , age = 18
      }
      let form = adultForm user
      shouldBe form ValidForm
