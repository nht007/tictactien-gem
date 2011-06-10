class GameState
  attr_accessor :board, :active_player
  
  def initialize(board, active_player)
    @board = board
    @active_player = active_player
  end
end