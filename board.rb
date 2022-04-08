require_relative "tile"

class board
    
    def initialize(grid_size, num_bombs)
        @grid_size - grid_size
        @num_bombs = num_bombs

        generate_board
    end

    attr_reader :grid_size, :num_bombs

end