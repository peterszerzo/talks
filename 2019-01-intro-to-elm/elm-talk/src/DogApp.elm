module DogApp exposing (main)

import Browser
import Dict
import Html exposing (Html, a, div, p, text)
import Html.Attributes exposing (style, value)
import Html.Events exposing (onClick)
import Http
import Json.Decode as Decode
import Json.Encode as Encode



-- Entry point


main : Program Flags Model Msg
main =
    Browser.element
        { init = init
        , update = update
        , view = view
        , subscriptions = subscriptions
        }



-- Model


type alias Model =
    { breeds : List String
    , breedPhoto : Maybe ( String, Maybe (Result Http.Error String) )
    }


type alias Flags =
    Encode.Value


init : Flags -> ( Model, Cmd Msg )
init flags =
    ( { breeds = []
      , breedPhoto = Nothing
      }
    , fetchBreeds
    )



-- Update


type Msg
    = GetBreeds (Result Http.Error (List String))
    | SelectBreed String
    | GetBreedPhoto String (Result Http.Error String)


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        GetBreeds breeds ->
            ( { model
                | breeds = Result.withDefault [] breeds
              }
            , Cmd.none
            )

        SelectBreed breed ->
            ( { model
                | breedPhoto =
                    Just ( breed, Nothing )
              }
            , fetchBreedPhoto breed
            )

        GetBreedPhoto breed photo ->
            ( { model
                | breedPhoto =
                    Just
                        ( breed
                        , Just photo
                        )
              }
            , Cmd.none
            )



-- View


view : Model -> Html Msg
view model =
    div []
        [ div []
            [ div
                []
                (List.map
                    (\breed ->
                        div
                            [ onClick (SelectBreed breed) ]
                            [ text breed ]
                    )
                    model.breeds
                )
            , model.breedPhoto
                |> Maybe.andThen Tuple.second
                |> Maybe.andThen Result.toMaybe
                |> Maybe.map
                    (\image ->
                        div
                            [ style "background-image" <| "url(" ++ image ++ ")"
                            , style "background-size" "cover"
                            , style "background-position" "50% 50%"
                            , style "width" "200px"
                            , style "height" "300px"
                            ]
                            [ text "" ]
                    )
                |> Maybe.withDefault (text "")
            ]
        ]



-- Subscriptions


subscriptions : Model -> Sub Msg
subscriptions model =
    Sub.none



-- Utilities


fetchBreeds : Cmd Msg
fetchBreeds =
    Http.get
        { url = "https://dog.ceo/api/breeds/list/all"
        , expect = Http.expectJson GetBreeds breedsDecoder
        }


fetchBreedPhoto : String -> Cmd Msg
fetchBreedPhoto breed =
    Http.get
        { url = "https://dog.ceo/api/breed/" ++ breed ++ "/images"
        , expect = Http.expectJson (GetBreedPhoto breed) breedPhotoDecoder
        }


breedsDecoder : Decode.Decoder (List String)
breedsDecoder =
    Decode.field "message"
        (Decode.dict
            (Decode.list Decode.string)
            |> Decode.map Dict.keys
        )


breedPhotoDecoder : Decode.Decoder String
breedPhotoDecoder =
    Decode.field "message" (Decode.list Decode.string)
        |> Decode.andThen
            (\images ->
                case List.head images of
                    Just image ->
                        Decode.succeed image

                    _ ->
                        Decode.fail "Images array is empty"
            )
