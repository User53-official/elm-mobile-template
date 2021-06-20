port module Shared exposing (..)

import Data.User exposing (User)


type alias Shared =
  { user : User
  , lastPageName : String
  }


port requestShared : (() -> msg) -> Sub msg


port sendShared : Shared -> Cmd msg
