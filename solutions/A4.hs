module A4 where

import A1
import A2
import A3 hiding (
  _HEADER_,
  showSquares,
  dropFirstCol,
  dropLastCol,
  formatRows,
  isWinningLine,
  prependRowIndices
  )

-- *** Assignment 4-1 *** --

-- Q#01
_HEADER_ =  ' ' : formatLine (map show _RANGE_)
-- Q#02

showSquares:: [Square] -> [String]
showSquares = map show

-- Q#03
dropFirstCol:: Board -> Board
dropFirstCol = map tail

-- Q#04
dropLastCol:: Board -> Board
dropLastCol = map init

--Q#05
formatRows:: [Row] -> [String]
formatRows =  map $ formatLine . showSquares 

-- Q#06
isWinningLine:: Player -> Line -> Bool
isWinningLine_ _ [] = False
isWinningLine_ player line = null $ filter (\x -> x == E || x /= player) line


-- *** Assignment 4-2 *** --

-- Q#07

isWinningLine = undefined

-- Q#08

hasWon = undefined

-- Q#09

getGameState = undefined


playMove = undefined

-- Q#10

prependRowIndices = undefined

-- Q#11

formatBoard = undefined