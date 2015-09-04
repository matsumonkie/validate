import Model.User
import Form.User

main :: IO ()
main = do
  let user = User {
    firstname = "John"
  , lastname = "Doe"
  , age = 12
  } in
    print $ form user
