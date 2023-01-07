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
isColEmpty [] _ = False
isColEmpty xs i
    | i >= length xs = False
    | i < 0 = False
    | otherwise  = xs !! i == EMPTY


-- Q#05
dropFirstCol:: Board -> Board
dropFirstCol [] = []
dropFirstCol (x:xs) = tail x : dropFirstCol xs
    
dropLastCol:: Board -> Board
dropLastCol [] = []
dropLastCol (x:xs) = init x : dropLastCol xs

-- Q#06
getDiag1:: Board -> Line
getDiag1 [] = []
getDiag1 (x:xs)= head x : getDiag1 (dropFirstCol xs)
            

getDiag2:: Board -> Line
getDiag2 [] = []
getDiag2 (x:xs) = last x : getDiag2 (dropLastCol xs)

getAllLines:: Board -> [Line]
getAllLines board = board ++ transpose board ++ [getDiag1 board] ++ [getDiag2 board]

-- *** Assignment 3-2 ***

-- Q#07

putSquare = undefined

-- Q#08

prependRowIndices = undefined

-- Q#09

isWinningLine = undefined

-- Q#10

isValidMove = undefined