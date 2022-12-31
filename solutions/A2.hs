{-# OPTIONS_GHC -Wno-unrecognised-pragmas #-}

module A2 where

import A1
import Data.List (intercalate)
import Data.Char (digitToInt)

-- *** Assignment 2-1 *** --

-- Q#01
promptPlayer:: Player -> String
promptPlayer p =   "Player " ++ show p ++ "'s turn: enter a row and column position (ex."

-- Q#02
_RANGE_ = [0.._SIZE_ -1]

-- Q#03
isDigit::Char -> Bool
isDigit x = x `elem` nums
    where 
        nums = ['0'..'9']

readDigit:: Char -> Int
readDigit x
    | not $ isDigit x = -1  
    | otherwise = digitToInt x

-- Q#04

_EMPTY_ROW_ = replicate _SIZE_ EMPTY


_EMPTY_BOARD_ = replicate _SIZE_ _EMPTY_ROW_

-- Q#05
isTied:: Board -> Bool
isTied [] = True
isTied (x:xs)
    | null x = True
    | EMPTY `elem` x = False
    | otherwise = isTied xs 


_TIED_BOARD_ = [
    [X, O, O]
  , [O, X, X]
  , [O, X, O]
  ]

-- Q#06
indexRowStrings:: [String] -> [(Char, String)]
indexRowStrings x = zip ['A'..] x

-- Q#07
formatLine:: [String] -> String
formatLine x = _SEP_ ++ intercalate _SEP_ x ++ _SEP_

-- *** Assignment 2-2 *** --

-- Q#08
isMoveInBounds:: Move -> Bool
isMoveInBounds move = rowWithinBounds move && colWithinBounds move
    where 
        rowWithinBounds (row, _) = row >=0 && row < _SIZE_
        colWithinBounds (_, col) = col >= 0 && col < _SIZE_ 

-- Q#09
stringToMove:: String -> Move
stringToMove [] = _INVALID_MOVE_
stringToMove [_] = _INVALID_MOVE_
stringToMove (x:y:z:_) = _INVALID_MOVE_
stringToMove (x:y:_) = (convertRowIndex x,  readDigit y)


-- Q#10
replaceSquareInRow:: Player -> Int -> Row -> Row
replaceSquareInRow player index row 
    | index >=length row = row
    | index < 0 = row
    | otherwise = combined 
        where 
            arr = splitAt (index+1) row
            first = fst arr
            second = snd arr
            combined
                | not (null (init first)) = init first ++ [player] ++ second
                | otherwise = player: second 

rsX = replaceSquareInRow  X 

rsO = replaceSquareInRow  O 
        