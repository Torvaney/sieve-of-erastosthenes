import Html exposing (Html, beginnerProgram, button, div, h1, text, br)
import Html.Events exposing (onClick)

import Types exposing (..)
import Sieve exposing (..)


main =
  beginnerProgram
    { model = init
    , view = view
    , update = update
    }


-- MODEL


init : Model
init =
  { max = maxNum
  , primes = []
  , lastChecked = 1
  }


-- UPDATE


update : Msg -> Model -> Model
update msg model =
  case msg of
    Next ->
      checkNextNumber model
    All ->
      checkAllNumbers model
    Reset ->
      init


-- VIEW


view : Model -> Html Msg
view model =
  div
    []
    [ h1 [] [ text "Check primes up to 100" ]
    , text "Primes: "
    , text <| toString <| List.sort <| model.primes
    , br [] []
    , text ("Last number checked: " ++ (toString model.lastChecked))
    , br [] []
    , button
      [ onClick Next ]
      [ text "Check next number" ]
    , button
      [ onClick All ]
      [ text "All primes" ]
    , button
      [ onClick Reset ]
      [ text "Reset" ]
    ]
