module Game.TicTacToe.Game
(

) where

import Game.TicTacToe.Board

--
-- Game
--
-- Game is represented by a GameResult which contains player information,
-- a game status field and a board representation.

data GameResult = GameResult
  { status  :: GameStatus
  , player1 :: Player
  , player2 :: Player
  , board   :: Board
  } deriving (Eq, Show)

data GameStatus =
  Unplayed
  | Playing
  | Drawn         -- finished, no winner
  | Won Player    -- finished, with winner
  deriving (Eq, Show)

type Player = String



--
-- status helpers
--

isUnplayed :: GameStatus -> Bool
isUnplayed s = s == Unplayed

isPlaying :: GameStatus -> Bool
isPlaying s = case s of
                Unplayed -> True
                Playing  -> True
                _        -> False

isFinished :: GameStatus -> Bool
isFinished s = case s of
                 Won p -> True
                 Drawn -> True
                 _     -> False


--
-- operations
--

--
-- newGame creates a GameResult that represents a new (i.e unplayed) game
--
-- > let g = newGame "Red" "Black"
--
-- > GameResult {status = NewGame, player1 = "Red", player2 = "Black",
-- > board = Board {nw = ' ', n = ' ', ne = ' ', e = ' ', c = ' ', w = ' ',
-- > se = ' ', s = ' ', sw = ' '}}
--
newGame :: Player -> Player -> GameResult
newGame p1 p2 = GameResult Unplayed p1 p2 newBoard


-- takeBack takes a GameResult and returns a new GameResult representing the
-- state of the Game prior to the move
--
takeBack :: GameResult -> Position -> Maybe GameResult
takeBack g p = case status g of
                 Playing -> Just g -- FIXME: needs to modify g -> g' by taking back the move
                 _       -> Nothing


--
-- whoWon takes a GameResult and returns the winner (if any)
--
whoWon :: GameResult -> Maybe Player
whoWon g = case status g of
             Won p -> Just p
             _     -> Nothing


-- playerAt takes a GameResult and position and returns the player (if any) at
-- the specified position
-- playerAt :: GameResult -> Position -> Maybe Player
-- playerAt g p = case board g


{-
move rules:

1. Only allow a move if 'status' is Playing
2. Only allow a move if specified position is Empty

-}


--
-- move takes a position and a GameResult and returns a new GameResult reflecting
-- the result of the move.
-- FIXME Maybe GameResult
-- move :: GameResult -> Move -> GameResult
-- move g m =
