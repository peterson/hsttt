module Game.TicTacToe.Board
(
  Board,
  newBoard,

  Position
) where


data Board = Board
  { nw :: Position
  , n  :: Position
  , ne :: Position
  , e  :: Position
  , c  :: Position -- middle of board
  , w  :: Position
  , se :: Position
  , s  :: Position
  , sw :: Position
  } deriving (Eq, Show)



--
-- Board
--

--
-- The board is represented as 8 compass directions (NE, NW etc) with a central
-- element ('c') in the middle of the board.
-- ---------------
-- | ne | n | nw |
-- | e  | c | w  |
-- | se | s | sw |
-- ---------------
--

-- The fundamental 'atom' of tic-tac-toe. Each position is either Empty, or
-- contains a Circle ("O") or Cross ("X")
data Position =
  Empty
  | Circle  -- "O"
  | Cross   -- "X"
  deriving (Eq)

instance Show (Position) where
  show Empty  = show ' '
  show Circle = show 'O'
  show Cross  = show 'X'

--
-- creates an new board which is empty
newBoard :: Board
newBoard = Board Empty Empty Empty Empty Empty Empty Empty Empty Empty
-- newBoard = Board (replicate 9 Empty) -- .. or something like this? (to init record!)



-- isBoardEmpty :: Board -> Bool
-- isBoardFull :: Board -> Bool

-- isPositionEmpty :: Board -> Position -> Bool
-- playerAtPosition :: Board -> Position -> Player
