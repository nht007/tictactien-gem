# require 'ai' 
# require 'minimax'

class PerfectAi < Ai
  def calculate_move(board, current_player)
    if board.available_spaces.count == 9
      return [0,0]
    end
    
    minimax = Minimax.new(board, nil, current_player.token, current_player.token)
    minimax.build_tree
    minimax.get_next_move
  end  
end