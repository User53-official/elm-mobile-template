module NotFound exposing (main)

import Browser exposing (Document)
import Html
import Shared exposing (Shared)
import Html.Attributes exposing (href)


-- Types --


type Msg = SendShared


-- Model --


type alias Model =
  { shared : Shared }


init : Shared -> ( Model, Cmd Msg )
init shared =
  ( { shared = shared }, Cmd.none )


-- View --


view : Model -> Document Msg
view { shared } =
  { title = "404 - Not Found"
  , body =
      [ Html.div [] [ Html.text "Page not found" ]
      , Html.a [ href ("#" ++ shared.lastPageName) ] 
          [ Html.text "Press this to go to the previous page." ]
      ]
  }


-- Update --


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
  case msg of
    SendShared ->
      ( model
      , Shared.sendShared model.shared
      )


-- Subscriptions --


subscriptions : Model -> Sub Msg
subscriptions _ =
  Sub.batch 
    [ Shared.requestShared (\_ -> SendShared) ]


main : Program Shared Model Msg
main = 
  Browser.document
    { init = init
    , view = view
    , update = update
    , subscriptions = subscriptions
    }