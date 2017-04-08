module Convert
( convertNumByArrays
, convertNum
, convertNumBySpaces
) where

import Data.Char
import Data.List.Split


-- system decimal == 10  | bin == 2...
type System = Int
-- bin 0101 == [0,1,0,1] | decimal 10 = [1, 0] ...
type GeneralNumber = [Int]
-- nothing special... just integer (but were sure, that its in decimal system)
type DecNumber = Int
-- 10 (sys 10) = "10" (sys 10) |10 (sys 10) = "A" (sys 16) => max limit is 35
type SpecialCharsNum = String
-- 10 (sys 10) = "1 0" (sys 10) | 30 (sys 10) = "1E" (sys 16) => max limit is 35
type SpaceSplitInt = String

-- convert from decimal
-- take system and decimal number and return convert GeneralNumber 
conFromDec :: System -> DecNumber -> GeneralNumber
conFromDec _ 0 = []
conFromDec system x =
    conFromDec system (x `div` system) ++ [x `mod` system]


--convertToDecimal
-- ill take system and general number and return basic integer (in decimal system)
conToDec :: System -> GeneralNumber -> DecNumber
conToDec _ [] = 0
conToDec system (x:xs) =
    x * system^ length xs + conToDec system xs

-- take system1 from and system2 to
-- and convert general number from system1 to system2
somethingToSomething :: System -> System -> GeneralNumber -> GeneralNumber
somethingToSomething s1 s2 =
  conFromDec s2 . conToDec s1


-- === parsing and decoding function ===
-- convert GeneralNumber to String (A == 10 | B ==11 ... )
arrToStrNum :: GeneralNumber -> String
arrToStrNum =
  let mapFunc i = if i < 10 then chr (i + ord '0')
                            else (toUpper . chr) (i - 10 + ord 'a')
  in map mapFunc

-- parse NumberInString to GeneralNumber ("12A" => [1,2,10])
-- max limit is 35... -> no abbrevation for another special chars
parseHigherSystems :: SpecialCharsNum -> GeneralNumber
parseHigherSystems =
  let mapFunc i = if (ord i - ord '0' ) < 10  then ord i - ord '0'
                                              else 10 + ord i - ord 'A'
  in map (mapFunc . toUpper)


-- === validations ===
-- check if General Number is valid in Current System
-- [0,1,0,1] is valid in system 2
-- [0,1,0,9] isnt valid in system 2
validMetrix :: System -> GeneralNumber -> Bool
validMetrix system value =
  not $ False `elem` (map (<system) value )


-- public api for user
-- convert number from System1 to System2
-- input is for example "1010" and return is "A"
-- max limit is 35 system...
convertNum :: System -> System -> SpecialCharsNum -> Maybe SpecialCharsNum
convertNum s1 s2 val = 
  let arrNum = parseHigherSystems val
  in 
    if validMetrix s1 arrNum
        then Just $ arrToStrNum $ somethingToSomething s1 s2 arrNum
        else Nothing
  

-- take generalNumber in system1 and rerurn convert number to system 2
convertNumByArrays :: System -> System -> GeneralNumber -> Maybe GeneralNumber
convertNumByArrays s1 s2 val = 
  if validMetrix s1 val 
    then Just $ somethingToSomething s1 s2 val
    else Nothing


-- third variant is split digit by space -> 60 systems -> "54 10 30 45"
-- (System1 -> System2) => (2-16) take String like "1 0 1 0" and return for example 16 "A"
-- different inputs and outputs... inputs string split by " " and outup is specialCharsNum...
-- must fix..
convertNumBySpaces :: System -> System -> String -> Maybe String
convertNumBySpaces s1 s2 val =
  let arrNum = map (\i -> read i :: Int) (splitOn " " val)
  in 
    if validMetrix s1 arrNum
      then Just $ arrToStrNum $ somethingToSomething s1 s2 arrNum
      else Nothing

--validation
-- TODO
-- last step for basic validations....
-- create options for inputs and ouputs...
    -- spaces | arrays | string (limit 35 = length (alphabet + 0..9))









--
