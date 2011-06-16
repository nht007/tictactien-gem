require 'spec_helper'

describe "RailsGame" do
  it "chooses the first player as human" do
    rails_game = RailsGame.new
    rails_game.choose_player_one("Human")
    
    rails_game.players[:one].class.should == HumanPlayer
    rails_game.players[:one].token.should == 'x'
  end
  
  it "chooses the first player as a Random CPU" do
    rails_game = RailsGame.new
    rails_game.choose_player_one("RandomCPU")
    
    rails_game.players[:one].class.should == CpuPlayer
    rails_game.players[:one].ai.class.should == RandomAi
    rails_game.players[:one].token.should == 'x'
  end
  
  it "chooses the second player as a Perfect CPU" do
    rails_game = RailsGame.new
    rails_game.choose_player_two("PerfectCPU")
    
    rails_game.players[:two].class.should == CpuPlayer
    rails_game.players[:two].ai.class.should == PerfectAi
    rails_game.players[:two].token.should == 'o'
  end
  
  it "starts a rails game" do
    rails_game = RailsGame.new
    rails_game.choose_player_one("Human")
    rails_game.choose_player_two("RandomCPU")
    
    rails_game.start
    
    rails_game.game_state.active_player.should == rails_game.players[:one]
  end
end
