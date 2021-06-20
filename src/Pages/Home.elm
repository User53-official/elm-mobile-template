module Home exposing (main)

import Browser exposing (Document)
import Html
import Shared exposing (Shared)


-- Types --


type Msg
  = SendShared


-- Model --


type alias Model =
  { shared : Shared }


init : Shared -> ( Model, Cmd Msg )
init shared =
  ( { shared = shared }, Cmd.none )


-- View --


view : Model -> Document Msg
view _ =
  { title = "Home"
  , body =
      [ Html.text "Welcome to the Home Page!"
      ]
  }


-- Update --


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
  case msg of
    SendShared ->
      ( model, Shared.sendShared model.shared )


-- Subscriptions --


subscriptions : Model -> Sub Msg
subscriptions _ =
  Sub.batch 
    [ Shared.requestShared (\_ -> SendShared)
    ]


main : Program Shared Model Msg
main = 
  Browser.document
    { init = init
    , view = view
    , update = update
    , subscriptions = subscriptions
    }