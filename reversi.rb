module Reversi
  class Board

    MOVE_DIRECTIONS = [
        [1, 0],[-1, 0],[0, -1],[0, 1],
        [1, 1],[1, -1],[-1, 1],[-1,-1]
      ]

    attr_accessor :grid

    def initialize
      @grid = create_grid
      populate_board
    end

    def create_grid
      grid = Array.new(8) { Array.new(8) }
    end

    def populate_board
      @grid[3][3] = :black
      @grid[4][4] = :black
      @grid[3][4] = :white
      @grid[4][3] = :white
    end

    def place_piece(color, coordinate_pair)
      row, col = coordinate_pair
      @grid[row][col] = color
    end

    def find_pieces(color)
      piece_coordinates = []
      @grid.each_with_index do |row, row_i|
        row.each_with_index do |cell, col_i|
          piece_coordinates << [row_i, col_i] if cell == color
        end
      end
      piece_coordinates
    end

    def off_board?(coordinate_pair)
      row, col = coordinate_pair
      return false if (0..7).include?(row) && (0..7).include?(col)
      true
    end

    def find_moves(coordinate_pair)
      all_end_moves = []

      MOVE_DIRECTIONS.each do |direction|
        one_direction = []
        row, col = coordinate_pair
        until off_board?([row + direction[0] ,col + direction[1]])
          one_direction << [row + direction[0] ,col + direction[1]]
          row += direction[0]
          col += direction[1]
        end
        all_end_moves << one_direction
      end
      all_end_moves
    end

  end

end