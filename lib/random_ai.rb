# require 'ai'

class RandomAi < Ai
  def calculate_move(board, current_player)
    board.available_spaces.sample
  end
end