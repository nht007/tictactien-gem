require 'spec_helper'

describe "Game" do
  it "creates a new game" do
    player_one = PlayerFactory.create_player('Random CPU', 'x')
    player_two = PlayerFactory.create_player('Random CPU', 'o')
    
    game = Game.new
    game.players = {:one => player_one, :two => player_two}
    game.game_state = GameState.new(player_one)
    
    game.game_state.should_not be_nil
  end  
  
  it "switches the active player" do
    player_one = PlayerFactory.create_player('Random CPU', 'x')
    player_two = PlayerFactory.create_player('Random CPU', 'o')
    
    game = Game.new
    game.players = {:one => player_one, :two => player_two}
    game.game_state = GameState.new(player_one)
    
    game.switch_active_player
    game.game_state.active_player.should == player_two
    game.switch_active_player
    game.game_state.active_player.should == player_one
    game.switch_active_player
    game.game_state.active_player.should == player_two
  end
end
