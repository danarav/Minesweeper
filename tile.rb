class Tile

    DELTAS = [
    [-1, -1],
    [-1,  0],
    [-1,  1],
    [ 0, -1],
    [ 0,  1],
    [ 1, -1],
    [ 1,  0],
    [ 1,  1]
    ].freeze

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

   def adjacent_bomb_count
    neighbors.select(&:bombed?).count
   end

   def neighbors
        adjacent_coords = DELTAS.map do |(dx, dy)|
            [pos[0] + dx, pos[1] + dy]
        end.select do |row, col|
            [row, col].all? do |coord|
                coord.between?(0, @board.grid_size - 1)
            end
        end

        adjacent_coords.map { |pos| @board[pos] }
   end

    def explore 
        return self if flagged?
        return self if explored?
        @explored = true
        if !bombed? && adjacent_bomb_count == 0
            neighbors.each(&:explore)
        end

        self
    end

    def inspect
        {pos: pos,
        bombed: bombed?
        flagged: flagged?
        explored: explored? }.inspect
    end

    def plant_bomb
        @bombed = true
    end

    def render
        if flagged?
            bombed? ? "F" : "f"
        elsif bombed?
            explored? ? "X" : "B"
        else
            adjacent_bomb_count == 0 ? "_" : adjacent_bomb_count.to_s
        end
    end

end