# require 'player'

class CpuPlayer < Player
  attr_accessor :ai
  
  def initialize(token, ai)
    @token = token
    @ai = ai  
  end
  
  def perform_move(board)
    move = @ai.calculate_move(board, self)
    
    board.add_piece(@token, move)
  end
end