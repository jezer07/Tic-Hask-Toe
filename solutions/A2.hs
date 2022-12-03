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
formatLine x = _SEP_ ++ intercalate _SEP_ x

-- *** Assignment 2-2 *** --

-- Q#08

isMoveInBounds = undefined

-- Q#09

stringToMove = undefined

-- Q#10

replaceSquareInRow = undefined