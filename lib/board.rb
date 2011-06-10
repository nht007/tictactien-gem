class Board
  attr_accessor :grid
  
  def initialize
    @grid = [[nil, nil, nil],
             [nil, nil, nil],
             [nil, nil, nil]]
  end
  
  def clone
    board = Board.new
    board.grid = [[@grid[0][0], @grid[0][1], @grid[0][2]],
                  [@grid[1][0], @grid[1][1], @grid[1][2]],
                  [@grid[2][0], @grid[2][1], @grid[2][2]]]
    return board
  end
  
  # checks for empty(nil) spaces on the grid
  def available_spaces
    spaces = []
    @grid.each_with_index do |column, col_index|
      column.each_with_index do |space, row_index|
        spaces << [col_index, row_index] if space == nil
      end
    end
    spaces
  end
  
  # adds a piece to the grid
  # indexes start at 0 from the top left corner of the grid
  def add_piece(player_token, location)
    if @grid[location.first][location.last]
      return false   
    end
  
    @grid[location.first][location.last] = player_token  
    return true
  end
  
  # determines if there is a winning player and returns that player token
  def calculate_win
    return diagonal_win if diagonal_win
    return horizontal_win if horizontal_win
    return vertical_win if vertical_win
    return 'nobody' if cat_game?
  end
  
  def print
    puts "\n"
    puts "#{@grid[0]}\n"
    puts "#{@grid[1]}\n"
    puts "#{@grid[2]}\n"
  end
  
  private

  def diagonal_win
    # top left to bottom right
    if @grid[0][0] == @grid[1][1] && @grid[1][1] == @grid[2][2] && @grid[0][0]
      return @grid[0][0]
    end
    
    # bottom left to top right
    if @grid[0][2] == @grid[1][1] && @grid[1][1] == @grid[2][0] && @grid[0][2]
      return @grid[0][2]
    end
  end
  
  def horizontal_win
    # top row
    if @grid[0][0] == @grid[0][1] && @grid[0][1] == @grid[0][2] && @grid[0][0]
      return @grid[0][0]
    end
    
    # middle row
    if @grid[1][0] == @grid[1][1] && @grid[1][1] == @grid[1][2] && @grid[1][0]
      return @grid[1][0]
    end
    
    # bottom row
    if @grid[2][0] == @grid[2][1] && @grid[2][1] == @grid[2][2] && @grid[2][0]
      return @grid[2][0]
    end
  end
  
  def vertical_win
    # top row
    if @grid[0][0] == @grid[1][0] && @grid[1][0] == @grid[2][0] && @grid[0][0]
      return @grid[0][0]
    end
    
    # middle row
    if @grid[0][1] == @grid[1][1] && @grid[1][1] == @grid[2][1] && @grid[0][1]
      return @grid[0][1]
    end

    # bottom row
    if @grid[0][2] == @grid[1][2] && @grid[1][2] == @grid[2][2] && @grid[0][2]
      return @grid[0][2]
    end
  end
  
  def cat_game?
    @grid.each do |row|
      row.each do |space|
        return false if not space
      end
    end
    return true
  end  
end