class GameState
  attr_accessor :board, :active_player
  
  def initialize(board=Board.new, active_player)
    @board = board
    @active_player = active_player
  end
  
  def perform_move(move)
    @active_player.perform_move(self, move)
  end
  
  def update(move)
    return @board.add_piece(@active_player.token, move)
  end
  
  def check_win
    @board.calculate_win
  end
  
  def active_player_class
    @active_player.class.inspect
  end
end
