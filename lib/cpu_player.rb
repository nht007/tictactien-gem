# require 'player'

class CpuPlayer < Player
  attr_accessor :ai
  
  def initialize(token, ai)
    @token = token
    @ai = ai  
  end
  
  def perform_move(game_state, move_param = nil)
    move = @ai.calculate_move(game_state.board, self)
    
#    board.add_piece(@token, move)
    game_state.update(move)
  end
end
