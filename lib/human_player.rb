# require 'player'

class HumanPlayer < Player
  def perform_move(game_state, move)
#    location = Game.ask_move(board, @token)
#    board.add_piece(@token, location)
    game_state.update(move)
  end
end
