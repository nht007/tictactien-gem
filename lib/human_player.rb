# require 'player'

class HumanPlayer < Player
  def perform_move(board)
    location = Game.ask_move(board, @token)
    return if board.add_piece(@token, location)
  end
end