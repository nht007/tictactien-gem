require 'spec_helper'

describe "GameState" do
  it "creates a snapshot of the current game state" do
    board = Board.new
    active_player = Player.new('x')
    
    game_state = GameState.new(board, active_player)
    
    game_state.board.should == board
    game_state.active_player.should == active_player
  end
end