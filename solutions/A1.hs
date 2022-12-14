module A1 where

import Data.Char (toUpper)

-- *** Assignment 1-1 *** --

-- Q#01
_SIZE_ :: Int
_SIZE_ = 3

-- Q#02
_DISPLAY_LOGO_ :: Bool
_DISPLAY_LOGO_ = True

-- Q#03
convertRowIndex:: Char -> Int
convertRowIndex n = fromEnum (toUpper n) - 65

-- Q#04
_INVALID_MOVE_:: (Int, Int)
_INVALID_MOVE_ = (-1,-1)

-- Q#05

_SEP_ = ['_','|','_']

-- *** Assignment 1-2 *** --

-- Q#06
data Square = X | O | EMPTY deriving (Eq, Show)


-- Q#07
data GameState = X_WON | O_WON | TIE | IN_PROGRESS deriving Show


-- Q#08
type Player = Square
type Row = [Square]
type Line = [Square]
type Board = [Row]
type Move = (Int, Int)

-- Q#09
getFirstPlayer:: Bool -> Player
getFirstPlayer x = if x then X else O

getFirstPlayer_ :: Bool -> Player
getFirstPlayer_ x 
    | x = X
    | not x = O
    | otherwise = undefined

-- Q#10

showGameState gs = case gs of 
    X_WON -> "X Won!"
    O_WON -> "Y Won!"
    TIE -> "It's a tie!"
    IN_PROGRESS -> "Game is in-progress"


-- Q#11

switchPlayer p = case p of 
    X -> O
    O -> X
    EMPTY -> EMPTY 


-- Q#12

showSquare sq = case sq of 
    X -> "X"
    O -> "O"
    EMPTY -> "_" 