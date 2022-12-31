module A3 where

import A1
import A2

import Data.List (transpose)

-- *** Assignment 3-1 ***

-- Q#01
showInts:: [Int] -> [String]
showInts = map show

_HEADER_ = formatLine $ showInts _RANGE_

-- Q#02
showSquares:: [Square] -> [String]
showSquares = map show


-- Q#03
formatRows:: [Row] -> [String]
formatRows = map $ formatLine . showSquares 

-- Q#04
isColEmpty:: Row -> Int -> Bool
isColEmpty row = undefined

-- Q#05

dropFirstCol = undefined


dropLastCol = undefined

-- Q#06

getDiag1 = undefined


getDiag2 = undefined


getAllLines = undefined

-- *** Assignment 3-2 ***

-- Q#07

putSquare = undefined

-- Q#08

prependRowIndices = undefined

-- Q#09

isWinningLine = undefined

-- Q#10

isValidMove = undefined