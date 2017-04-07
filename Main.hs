module Main where

import Convert


-- test for me ( developer :D )
main :: IO ()
main = -- do
  putStrLn $ "vysledek čísla je: "
      ++ show ( convertNum 8 16 "11057")
