require 'spec_helper'

describe "Game" do
  it "creates a new game" do
    player_one = PlayerFactory.create_player('Random CPU')
    player_two = PlayerFactory.create_player('Random CPU')
    
    game = Game.new(player_one, player_two)
    
    game.game_state.should_not be_nil
  end  
  
  it "switches the active player" do
    player_one = PlayerFactory.create_player('Random CPU')
    player_two = PlayerFactory.create_player('Random CPU')
    
    game = Game.new(player_one, player_two)
    
    game.switch_active_player
    game.game_state.active_player.should == player_two
    game.switch_active_player
    game.game_state.active_player.should == player_one
    game.switch_active_player
    game.game_state.active_player.should == player_two
  end
end