class Tile

   def initialize(board, pos)
        @board = board
        @pos = pos
        @bombed = false
        @explored = false
        @flagged = false
   end

end