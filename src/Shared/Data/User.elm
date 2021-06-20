module Data.User exposing (..)


type alias User =
  { name : String }


new : String -> User
new name =
  { name = name
  }