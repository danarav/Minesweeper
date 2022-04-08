class Tile

   def initialize(board, pos)
        @board = board
        @pos = pos
        @bombed = false
        @explored = false
        @flagged = false
   end

   attr_reader :pos

   def bombed?
    @bombed
   end

   def explored?
    @explored
   end

   def flagged?
    @flagged
   end

end