class Minimax
  attr_accessor :board, :last_move, :current_token, :root_token, :score
  
  def initialize(board, last_move, current_token, root_token)
    @board = board
    @last_move = last_move
    @current_token = current_token
    @root_token = root_token
    @children = []
  end
  
  def build_tree
    if game_ended
      @score = game_ended
      return
    end
    
    moves = @board.available_spaces
    
    moves.each do |move|
      next_board = @board.clone
      next_board.add_piece(@current_token, move)
      
      @children << Minimax.new(next_board, move, switch_token(@current_token), @root_token)
    end
      
    score_list = []
    @children.each do |child|
      child.build_tree
      score_list << child.score
    end
    
    # calculate score for non-leaf nodes
    if @current_token == @root_token
      @score = score_list.max
    else
      @score = score_list.min
    end
      
  end
  
  def game_ended
    if diagonal_win
      diagonal_win == @root_token ? 1 : -1
      
    elsif horizontal_win
      horizontal_win == @root_token ? 1 : -1
      
    elsif vertical_win
      vertical_win == @root_token ? 1 : -1
      
    elsif cat_game? # cat game
      0
    end
  end
  
  def get_next_move
    move_list = []
    @children.each do |child|
      move_list << [child.last_move, child.score]
    end
    
    move = move_list.max_by {|move| move.last}
    
    return move.first
  end
  
  private

  def switch_token(token)
    if token == 'x'
      return 'o'
    elsif token == 'o'
      return 'x'
    end
  end
  
  def diagonal_win
    # top left to bottom right
    if @board.grid[0][0] == @board.grid[1][1] && @board.grid[1][1] == @board.grid[2][2] && @board.grid[0][0]
      return @board.grid[0][0]
    end
    
    # bottom left to top right
    if @board.grid[0][2] == @board.grid[1][1] && @board.grid[1][1] == @board.grid[2][0] && @board.grid[0][2]
      return @board.grid[0][2]
    end
  end
  
  def horizontal_win
    # top row
    if @board.grid[0][0] == @board.grid[0][1] && @board.grid[0][1] == @board.grid[0][2] && @board.grid[0][0]
      return @board.grid[0][0]
    end
    
    # middle row
    if @board.grid[1][0] == @board.grid[1][1] && @board.grid[1][1] == @board.grid[1][2] && @board.grid[1][0]
      return @board.grid[1][0]
    end
    
    # bottom row
    if @board.grid[2][0] == @board.grid[2][1] && @board.grid[2][1] == @board.grid[2][2] && @board.grid[2][0]
      return @board.grid[2][0]
    end
  end
  
  def vertical_win
    # top row
    if @board.grid[0][0] == @board.grid[1][0] && @board.grid[1][0] == @board.grid[2][0] && @board.grid[0][0]
      return @board.grid[0][0]
    end
    
    # middle row
    if @board.grid[0][1] == @board.grid[1][1] && @board.grid[1][1] == @board.grid[2][1] && @board.grid[0][1]
      return @board.grid[0][1]
    end

    # bottom row
    if @board.grid[0][2] == @board.grid[1][2] && @board.grid[1][2] == @board.grid[2][2] && @board.grid[0][2]
      return @board.grid[0][2]
    end
  end
  
  def cat_game?
    @board.grid.each do |row|
      row.each do |space|
        return false if not space
      end
    end
    return true
  end  
end