module A5 where

import A1
import A2
import A3
import A4

import System.Random.Stateful (globalStdGen, uniformM)
import Control.Monad (when)

-- *** Assignment 5-1 *** --

-- Q#01
printBoard:: Board -> IO ()
printBoard = putStrLn . formatBoard 

-- Q#02
_LOGO_PATH_ :: FilePath
_LOGO_PATH_ = "./assets/logo.txt"

printLogo:: IO ()
printLogo =  readFile _LOGO_PATH_ >>= putStrLn

-- Q#03
_RANDOM_BOOL_ :: IO Bool
_RANDOM_BOOL_ = uniformM globalStdGen

firstPlayer::  IO Player
firstPlayer = _RANDOM_BOOL_ >>= (\x-> return $ getFirstPlayer x)

-- Q#04
getMove:: Board -> IO Move
getMove board = getLine >>= (\input ->  processMove input)
        where 
            processMove move = if isValidMove board (stringToMove move) 
                                then return (stringToMove move) 
                                else putStrLn "Invalid move! Try again" 
                                >> getMove board

-- Q#05

play = when _DISPLAY_LOGO_ 

-- *** Assignment 5-2 *** --

-- Q#07

printLogoDo = undefined

-- Q#08

firstPlayerDo = undefined

-- Q#09

getMoveDo = undefined

-- Q#10

playDo = undefined