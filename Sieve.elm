module Sieve exposing (..)

import Types exposing (..)


maxNum : Int
maxNum = 100


isDivisible : Int -> Int -> Bool
isDivisible x y =
  (x % y) == 0


notPrime : Int -> Model -> Bool
notPrime num model =
  List.any (isDivisible num) model.primes


checkPrime : Int -> Model -> Model
checkPrime num model =
  if num == 0 then
    model
  else if num == 1 then
    model
  else if (notPrime num model) then
    model
  else
    { model
    | primes = model.primes ++ [ num ]
    }


setCheck : Int -> Model -> Model
setCheck num model =
  { model
  | lastChecked = num
  }


incrementModel : Model -> Model
incrementModel model =
  { model
  | lastChecked = model.lastChecked + 1
  }


checkNextNumber : Model -> Model
checkNextNumber model =
  if (model.lastChecked < 100) then
    checkPrime (model.lastChecked + 1) model |>
      incrementModel
  else
    model


checkAllNumbers : Model -> Model
checkAllNumbers model =
  List.range (model.lastChecked + 1) model.max |>
    List.foldr checkPrime model |>
    setCheck maxNum
