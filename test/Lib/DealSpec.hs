module Lib.DealSpec (main, spec) where

import Test.Hspec
import Lib.Coerce
import Lib.Deal
import Data.Char

main :: IO ()
main = hspec spec

spec :: Spec
spec = do

  describe "simple attribute" $ do

    it "validate" $ do
      let name = "John"
      let constraint = Coerce "startWithCapital" (\(x:xs) -> isUpper x)
      let deal = mkDeal "name" constraint name
      shouldSatisfy deal valid

    it "invalidate" $ do
      let name = "james"
      let constraint = Coerce "startWithCapital" (\(x:xs) -> isUpper x)
      let deal = mkDeal "name" constraint name
      shouldSatisfy deal invalid
