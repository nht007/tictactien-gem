require 'spec_helper'

describe "CpuPlayer" do
  it "it has an AI" do
    cpu_player = CpuPlayer.new('x', RandomAi.new)
    
    cpu_player.ai.should_not be_nil
  end
  
  it "performs a move" do
    cpu_player = CpuPlayer.new('x', RandomAi.new)
    game_state  = GameState.new(cpu_player)
    board = game_state.board
    
    move = mock('move', :first => 0, :last => 0)
    cpu_player.ai.should_receive(:calculate_move).with(board, cpu_player).and_return(move)
    board.should_receive(:add_piece).with(cpu_player.token, move)
    
    cpu_player.perform_move(game_state)
  end
end
