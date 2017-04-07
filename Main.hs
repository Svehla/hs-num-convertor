module Main where

import Convert
import Data.Char --- chr



main :: IO ()
main = -- do
  putStrLn $ "vysledek čísla je: " ++ show ( stNum 10 16 [1,1,0,5,7])






parseHex :: String -> [Int]
parseHex = map hexChar

parseHex1 :: String -> [Int]
parseHex1 =
  let myF i = if (ord i  - ord '0' ) < 10  then ord i - ord '0'
                                           else 10 + ord i - ord 'A'
  in map (myF . toUpper)


--
