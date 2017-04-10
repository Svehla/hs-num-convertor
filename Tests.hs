module Main where

import Convert


import Data.Char


main :: IO ()
main =  do
  case convertNum 2 16 "1010" of
    Nothing -> putStrLn "Invalid inputs"
    Just q  -> putStrLn $ show $ q == "A"

  case convertNum 2 1 "1010" of
    Nothing -> putStrLn "Invalid inputs"
    Just q  -> putStrLn $ show $ q == "0000000000"

  case convertNum 1 2 "0000000000" of
    Nothing -> putStrLn "Invalid inputs"
    Just q  -> putStrLn $ show $ q == "1010"

  --case convertNum 10 1 "1010" of
  --  Nothing -> putStrLn "Invalid inputs"
  --  Just q  -> putStrLn q

  case convertNum 2 16 "1010A" of
    Nothing -> putStrLn "True" --"Invalid inputs"
    Just q  -> putStrLn q

  case convertNum 80 76 "1010," of
    Nothing -> putStrLn "True" -- "Invalid inputs"
    Just q  -> putStrLn q

  case convertNum 10 17 "16" of
    Nothing -> putStrLn "Invalid inputs" -- "Invalid inputs"
    Just q  -> putStrLn $ show $ q == "G"

  case convertNumByArrays 2 16 [1,0,1,0,2] of
    Nothing -> putStrLn "True" -- "Invalid inputs"
    Just q  -> print q

  case convertNumByArrays 2 16 [1,0,1,0] of
    Nothing -> putStrLn "Invalid inputs"
    Just q  -> print $ show $ q == [10]

  case convertNumBySpaces 2 16 "1 0 1 0 9" of
    Nothing -> putStrLn "True"
    Just q  -> print q

  case convertNumBySpaces 2 16 "1 0 1 0" of
    Nothing -> putStrLn "Invalid inputs"
    Just q  -> print $ show $ q == "10"
