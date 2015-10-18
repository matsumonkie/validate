module Lib.FormSpec (main, spec) where

import Test.Hspec
import Model.User
import Form.User
import Lib.Form

main :: IO ()
main = hspec spec

spec :: Spec
spec = do

  describe "match if" $ do

    it "both valid" $ do
      shouldBe ValidForm ValidForm

    it "both invalid" $ do
      let form1 = InvalidForm "model1" []
      let form2 = InvalidForm "model2" []
      shouldBe form1 form2

  describe "doesnt match if" $ do

    it "valid & invalid" $ do
      let form1 = InvalidForm "model1" []
      shouldNotBe form1 ValidForm
