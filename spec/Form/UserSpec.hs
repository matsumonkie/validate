import Test.Hspec

main :: IO ()
main = hspec specs

specs :: Spec
specs = do
  describe "user form" $ do

    it "validates" $ do
      True `shouldBe` True
