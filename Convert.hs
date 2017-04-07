module Convert
( sts
, stNum
) where

import Data.Char --- chr

-- convertFromDec
conFromDec :: Int -> Int -> [Int]
conFromDec _ 0 = []
conFromDec system x =
    conFromDec system (x `div` system) ++ [x `mod` system]

--convertToDecimal
-- system == soustava
conToDec :: Int -> [Int] -> Int
conToDec _ [] = 0
conToDec system (x:xs) =
    x * system^ length xs + conToDec system xs



sts :: Int -> Int -> [Int] -> [Int]
sts s1 s2 =
  conFromDec s2 . conToDec s1


arrToNum :: [Int] -> String
arrToNum =  map (\i -> if i < 10 then chr (i + ord '0')
                                 else chr (i - 10 + ord 'a'))


-- something to number
stNum :: Int -> Int -> [Int] -> String
stNum s1 s2 val = arrToNum $ sts s1 s2 val
--stNum s1 s2 val = arrToNum $ sts s1 s2 ( numToArr val )





--
