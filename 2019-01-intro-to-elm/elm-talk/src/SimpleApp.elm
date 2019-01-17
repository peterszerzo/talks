module SimpleApp exposing (main)

import Browser
import Html exposing (Html, button, div, text)
import Html.Events exposing (onClick)
import Json.Encode as Encode



-- Entry point


main : Program Encode.Value Model Msg
main =
    Browser.element
        { init = init
        , update = update
        , view = view
        , subscriptions = subscriptions
        }



-- Model


type alias Model =
    { value : String
    }


init : Encode.Value -> ( Model, Cmd Msg )
init flags =
    ( { value = "Apples" }
    , Cmd.none
    )



-- Update


type Msg
    = Reverse


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        Reverse ->
            ( { model | value = String.reverse model.value }
            , Cmd.none
            )



-- View


view : Model -> Html Msg
view model =
    div []
        [ text model.value
        , button [ onClick Reverse ] [ text "Reverse" ]
        ]



-- Subscriptions


subscriptions : Model -> Sub Msg
subscriptions model =
    Sub.none
