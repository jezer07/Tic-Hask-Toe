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
_RANGE_ = [1.._SIZE_]

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
isTied = undefined


_TIED_BOARD_ = undefined

-- Q#06

indexRowStrings = undefined

-- Q#07

formatLine = undefined

-- *** Assignment 2-2 *** --

-- Q#08

isMoveInBounds = undefined

-- Q#09

stringToMove = undefined

-- Q#10

replaceSquareInRow = undefined