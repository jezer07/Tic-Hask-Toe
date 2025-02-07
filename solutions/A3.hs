module A3 where

import A1
import A2

import Data.List (transpose)
import System.Posix.Internals (puts)

-- *** Assignment 3-1 ***

-- Q#01
showInts:: [Int] -> [String]
showInts [] = []
showInts (x:xs) = show x : showInts xs

_HEADER_:: String
_HEADER_ = ' ' : formatLine (showInts _RANGE_)
-- _HEADER_ = formatLine $ showInts _RANGE_

-- Q#02
showSquares:: [Square] -> [String]
showSquares [] = []
showSquares (x:xs) =  show x : showSquares xs


-- Q#03
formatRows:: [Row] -> [String]
formatRows [] = []
formatRows (x:xs)=  formatLine (showSquares x) : formatRows xs

-- Q#04

isColEmpty:: Row -> Int -> Bool
isColEmpty [] _ = False
isColEmpty (x:xs) 0 = x == E
isColEmpty row i = isColEmpty (drop i row) 0

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
putSquare :: Player -> Board -> Move -> Board
putSquare _ [] _ = []
putSquare player (x:xs) (0,c) = replaceSquareInRow player c x : xs
putSquare player (x:xs) (r,c) = x : putSquare player xs (r-1,c) 

-- Q#08
prependRowIndices:: [String] -> [String]
prependRowIndices = map processString . indexRowStrings 
    where 
        processString (x,y) = x:y

-- Q#09
isWinningLine:: Player -> Line -> Bool
isWinningLine _ [] = False
isWinningLine player line = isAllPlayerSquare False line
    where 
        isAllPlayerSquare bool [] = bool
        isAllPlayerSquare acc (x:xs) = x == player && x /= E && isAllPlayerSquare True xs

-- Q#10
isValidMove:: Board -> Move -> Bool
isValidMove [] _ = False
isValidMove board (r,c) = go 0 board
            where 
                go:: Int -> Board -> Bool
                go _ [] = False
                go i (x:xs) =  if isMoveInBounds (r,c) && i == r then 
                    isColEmpty x c else go (i+1) xs