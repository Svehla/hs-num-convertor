module Convert
( convertNumByArrays
, convertNum
, convertNumBySpaces
) where




import Data.Char
import Data.List.Split



-- ==================================
-- === aliases for more type code ===
-- ========================================
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


-- ========================================
-- ========= main logic functions =========
-- ========================================
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



-- =====================================
-- ======== parsing and decoding =======
-- =====================================
-- convert GeneralNumber to String (A == 10 | B == 11 ... )
arrToStrNum :: GeneralNumber -> String
arrToStrNum =
  let mapFunc i = if i < 10 then chr (i + ord '0')
                            else (toUpper . chr) (i - 10 + ord 'A')
  in map mapFunc

-- parse NumberInString to GeneralNumber ("12A" => [1,2,10])
-- max limit is 35... -> no abbrevation for another special chars
parseHigherSystems :: SpecialCharsNum -> GeneralNumber
parseHigherSystems =
  let mapFunc i = if (ord i - ord '0' ) < 10  then ord i - ord '0'
                                              else 10 + ord i - ord 'A'
  in map (mapFunc . toUpper)



-- =====================================
-- =========== validations =============
-- =====================================
-- check if General Number is valid in Current System
-- [0,1,0,1] is valid in system 2 && [0,1,0,9] isnt valid in system 2
enabledAbbrev = ['0'..'9'] ++ ['A'..'Z']

validMetrix :: System -> GeneralNumber -> Bool
validMetrix system = all (<system)

-- hasBoolInArr boolArr = not $ False `elem` boolArr -- valid max system
validMaxSystem :: String -> Bool
validMaxSystem = all $ ( `elem` enabledAbbrev) . toUpper

validMaxAbbrev :: System -> Bool
validMaxAbbrev = (>) (length enabledAbbrev)


-- =================================
-- ====== public api for user ======
-- =================================
-- convert number from System1 to System2
-- input is for example "1010" and return is "A"
-- max limit is 35 system...

--TODO 1 system implementation...
--addZeros :: Int -> String
--addZeros 0 = ""
--addZeros counter = "0" ++ addZeros counter-1
--TODO
--convertNum s1 1 _ = addZeros $ conToDec s1 [1,0,1]--Nothing -- cant use 1 system
--convertNum 1 _ _ = Nothing -- cant use 1 system

convertNum :: System -> System -> SpecialCharsNum -> Maybe SpecialCharsNum
convertNum s1 s2 val =
  let arrNum = parseHigherSystems val
  in if validMetrix s1 arrNum && validMaxSystem val && validMaxAbbrev s2
       then Just $ arrToStrNum $ somethingToSomething s1 s2 arrNum
       else Nothing


-- take generalNumber in system1 and rerurn convert number to system 2
convertNumByArrays :: System -> System -> GeneralNumber -> Maybe GeneralNumber
convertNumByArrays s1 s2 val =
  if validMetrix s1 val
    then Just $ somethingToSomething s1 s2 val
    else Nothing


-- split digit by space -> e.q. 60 systems -> "54 10 30 45"
-- (System1 -> System2) => (2-16) take String like "1 0 1 0" and return for example 16 "A"
-- different inputs and outputs... inputs string split by " " and outup is specialCharsNum...
-- must fix..
convertNumBySpaces :: System -> System -> String -> Maybe String
convertNumBySpaces s1 s2 val =
  let arrNum = map read $ splitOn " " val
  in if validMetrix s1 arrNum
       then Just $ arrToStrNum $ somethingToSomething s1 s2 arrNum
       else Nothing










-- stay atom... remove spaces on end of file :D
