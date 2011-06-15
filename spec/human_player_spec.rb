require 'spec_helper'

describe "HumanPlayer" do
  it "performs a move" do
    board = Board.new
    human_player = HumanPlayer.new('x')
    
    move = [0, 0]
    Game.stub(:ask_move).with(board, human_player.token).and_return(move)
    board.should_receive(:add_piece).with(human_player.token, move)
    
    human_player.perform_move(board)
  end
end