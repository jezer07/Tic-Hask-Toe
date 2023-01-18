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
import Foreign.Safe (Bits(xor))

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
isWinningLine_:: Player -> Line -> Bool
isWinningLine_ _ [] = False
isWinningLine_ player line = null $ filter (\x -> x == E || x /= player) line


-- *** Assignment 4-2 *** --

-- Q#07
isWinningLine:: Player -> Line -> Bool
isWinningLine _ [] = False
isWinningLine p xs = foldr (\x acc-> acc && (x == p && x /= E)) True xs
-- isWinningLine_ player line = foldr 

-- Q#08
hasWon:: Player -> Board -> Bool
hasWon p xs = foldr (\x acc -> acc || isWinningLine p x) False $ getAllLines xs

-- Q#09
getGameState:: Board -> GameState 
getGameState xs
  | hasWon X xs = X_WON
  | hasWon O xs = O_WON
  | isTied xs = TIE
  | otherwise = IN_PROGRESS

playMove :: Player -> Board -> Move -> (GameState, Board)
playMove p b m = let move = putSquare p b m in (getGameState move, move)

-- Q#10
prependRowIndices:: [String] -> [String]
prependRowIndices xs = zipWith (:) ['A'..] xs

-- Q#11
formatBoard:: Board -> String
formatBoard xs = unlines $ _HEADER_ :  prependRowIndices (formatRows xs)