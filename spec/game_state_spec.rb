require 'spec_helper'

describe "GameState" do
  it "creates a snapshot of the current game state" do
    board = Board.new
    active_player = Player.new('x')
    
    game_state = GameState.new(board, active_player)
    
    game_state.board.should == board
    game_state.active_player.should == active_player
  end
  
  it "updates its board state with a new move" do
    board = Board.new
    active_player = Player.new('x')
    game_state = GameState.new(board, active_player)
    
    move = mock('move', :first => 0, :last => 0)
    game_state.board.should_receive(:add_piece).with(game_state.active_player.token, move)
    game_state.update(move)
  end
  
  it "does not update its board state with an invalid move" do
    board = Board.new
    board.grid[0][0] = 'x'
    active_player = Player.new('x')
    game_state = GameState.new(board, active_player)
    
    move = mock('move', :first => 0, :last => 0)
    game_state.board.should_receive(:add_piece).with(game_state.active_player.token, move).and_return(false)
    game_state.update(move)
  end
end
