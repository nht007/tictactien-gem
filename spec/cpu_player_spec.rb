require 'spec_helper'

describe "CpuPlayer" do
  it "it has an AI" do
    cpu_player = CpuPlayer.new('x', RandomAi.new)
    
    cpu_player.ai.should_not be_nil
  end
  
  it "performs a move" do
    board = Board.new
    cpu_player = CpuPlayer.new('x', RandomAi.new)
    
    move = mock('move', :first => 0, :last => 0)
    cpu_player.ai.should_receive(:calculate_move).with(board).and_return(move)
    board.should_receive(:add_piece).with(cpu_player.token, move)
    
    cpu_player.perform_move(board)
  end
end