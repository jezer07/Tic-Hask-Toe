module Main where

import A1
import A2
import A3
import A4
import A5

main :: IO ()
main = do 
        player <-firstPlayer  
        playDo _EMPTY_BOARD_ player
