module Test exposing (main)

import Browser exposing (Document)
import Html
import Html.Attributes
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
  { title = "Test"
  , body =
      [ Html.div [] [ Html.text "Back to home page:" ]
      , Html.a [ Html.Attributes.href "#Home" ] [ Html.text "Back" ]
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