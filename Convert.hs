module Convert
( convertNumByArrays
, convertNum
, convertNumBySpaces
) where

import Data.Char
import Data.List.Split

-- convertFromDec
conFromDec :: Int -> Int -> [Int]
conFromDec _ 0 = []
conFromDec system x =
    conFromDec system (x `div` system) ++ [x `mod` system]


--convertToDecimal
conToDec :: Int -> [Int] -> Int
conToDec _ [] = 0
conToDec system (x:xs) =
    x * system^ length xs + conToDec system xs


somethingToSomething :: Int -> Int -> [Int] -> [Int]
somethingToSomething s1 s2 =
  conFromDec s2 . conToDec s1


-- parsing and decoding function
arrToStrNum :: [Int] -> String
arrToStrNum =
  let mapFunc i = if i < 10 then chr (i + ord '0')
                            else (toUpper . chr) (i - 10 + ord 'a')
  in map mapFunc


parseHigherSystems :: String -> [Int]
parseHigherSystems =
  let mapFunc i = if (ord i  - ord '0' ) < 10  then ord i - ord '0'
                                               else 10 + ord i - ord 'A'
  in map (mapFunc . toUpper)


-- public api for user
convertNum :: Int -> Int -> String -> String
convertNum s1 s2 val = arrToStrNum $ somethingToSomething s1 s2 (parseHigherSystems val)

convertNumByArrays :: Int -> Int -> [Int] -> [Int]
convertNumByArrays = somethingToSomething

-- third variant is split digit by space -> 60 systems -> "54 10 30 45"
convertNumBySpaces :: Int -> Int -> String -> String
convertNumBySpaces s1 s2 val =
  arrToStrNum $ somethingToSomething s1 s2 $ map (\i -> read i :: Int) (splitOn " " val)


--validation
-- TODO
-- last step for basic validations....
-- create options for inputs and ouputs...
    -- spaces | arrays | string (limit 35 = length (alphabet + 0..9))









--
