module Model.User
( User(..)
) where

data User =
  User {
    firstname :: String,
    lastname :: String,
    age :: Int
  } deriving Show
