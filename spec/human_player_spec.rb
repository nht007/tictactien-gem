require 'spec_helper'

describe "HumanPlayer" do
  it "performs a move" do
    board = Board.new
    human_player = HumanPlayer.new('x')
    
    # move = mock('move', :first => 0, :last => 0)
    # board.should_receive(:add_piece).with(human_player.token, move)
    
    human_player.perform_move(board)
  end
end