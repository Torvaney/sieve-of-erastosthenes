module Types exposing (..)


type Msg
  = Next
  | All
  | Reset


type alias Model =
  { max : Int
  , primes : List Int
  , lastChecked : Int
  }
