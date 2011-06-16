class GameState
  attr_accessor :board, :active_player
  
  def initialize(board=Board.new, active_player)
    @board = board
    @active_player = active_player
  end
  
  def update(move)
    @board.add_piece(@active_player.token, move)
  end
end
