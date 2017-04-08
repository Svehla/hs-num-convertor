module Main where

import Convert


import Data.Char


  -- test for me ( developer :D )


main :: IO ()
main =  do
  case convertNum 2 16 "1010A" of
    Nothing -> putStrLn "Invalid inputs"
    Just q  -> putStrLn q

  case convertNum 2 16 "1010" of
    Nothing -> putStrLn "Invalid inputs"
    Just q  -> putStrLn q

  case convertNumByArrays 2 16 [1,0,1,0,2] of
    Nothing -> putStrLn "Invalid inputs"
    Just q  -> putStrLn $ show q

  case convertNumByArrays 2 16 [1,0,1,0] of
    Nothing -> putStrLn "Invalid inputs"
    Just q  -> putStrLn $ show q

  case convertNumBySpaces 2 16 "1 0 1 0 9" of
    Nothing -> putStrLn "Invalid inputs"
    Just q  -> putStrLn $ show q

  case convertNumBySpaces 2 16 "1 0 1 0" of
    Nothing -> putStrLn "Invalid inputs"
    Just q  -> putStrLn $ show q
