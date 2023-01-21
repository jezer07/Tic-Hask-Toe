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
            processMove move = if isValidMove board converTedMove 
                                then return converTedMove
                                else putStrLn "Invalid move! Try again" >> getMove board
                                    where
                                        converTedMove = stringToMove move

-- Q#05
play :: Board -> Player -> IO ()
play board player = when _DISPLAY_LOGO_  printLogo >> 
    printBoard board >> putStrLn (promptPlayer player) >> 
    getMove board >>= (\move -> nextMove $ playMove player board move) 
    where
        nextMove (g,b) = if g == IN_PROGRESS 
            then play b (switchPlayer player) 
            else printBoard b >> putStrLn (showGameState g)
             

-- *** Assignment 5-2 *** --

-- Q#07
printLogoDo:: IO ()
printLogoDo = do
    logo <- readFile _LOGO_PATH_
    putStrLn logo

-- Q#08
firstPlayerDo::  IO Player
firstPlayerDo = do
    random <- _RANDOM_BOOL_
    return $ getFirstPlayer random

-- Q#09
getMoveDo:: Board -> IO Move
getMoveDo board = do
    input <- getLine
    let move = stringToMove input
    if isValidMove board move
        then return move
        else do 
            putStrLn "Invalid move! Try again"
            getMove board

-- Q#10
playDo :: Board -> Player -> IO ()
playDo board player = do
        when _DISPLAY_LOGO_  printLogo
        printBoard board
        putStrLn (promptPlayer player)
        move <- getMove board
        let (g,b) = playMove player board move
        if g == IN_PROGRESS 
            then play b (switchPlayer player) 
            else do printBoard b
                    putStrLn (showGameState g)