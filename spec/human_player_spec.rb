require 'spec_helper'

describe "HumanPlayer" do
  it "performs a move" do
    human_player = HumanPlayer.new('x')
    game_state = GameState.new(human_player)
    board = game_state.board
    
    move = [0, 0]
#    Game.stub(:ask_move).with(board, human_player.token).and_return(move)
    board.should_receive(:add_piece).with(human_player.token, move)
    
    human_player.perform_move(game_state, move)
  end
end
