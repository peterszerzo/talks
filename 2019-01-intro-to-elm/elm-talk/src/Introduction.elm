module Introduction exposing (main)

import Html exposing (Html, text)



-- [ "1", "two", "three" ]
--   -> [ "1" ]                (use `List.head`)
--   -> 1                      (use `String.toInt`)
--   -> 1 + 5                  (use `+`, duh :) )
--   -> 6
--   -> screen


nums : List String
nums =
    [ "1", "2", "3" ]


main : Html msg
main =
    nums
        |> List.head
        |> Maybe.andThen String.toInt
        |> Maybe.withDefault -1
        |> String.fromInt
        |> text
