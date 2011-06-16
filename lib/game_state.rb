class GameState
  attr_accessor :board, :active_player
  
  def initialize(board=Board.new, active_player)
    @board = board
    @active_player = active_player
  end
end
