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
  
  it "updates its state with a new move" do
    rails_game = RailsGame.new
    rails_game.choose_player_one("Human")
    rails_game.choose_player_two("RandomCPU")
    
    rails_game.start
    
    move = mock('move', :first => 0, :last => 0)
    rails_game.game_state.should_receive(:update).with(move)
    rails_game.stub!(:switch_active_player)
    
    rails_game.update(move)    
  end
  
  it "updates its state by switching the active player" do
    rails_game = RailsGame.new
    rails_game.choose_player_one("Human")
    rails_game.choose_player_two("RandomCPU")
    
    rails_game.start
    
    move = mock('move', :first => 0, :last => 0)
    rails_game.game_state.stub!(:update).with(move)
    rails_game.should_receive(:switch_active_player)
    
    rails_game.update(move)
  end
  
  it "prints the current board" do
    rails_game = RailsGame.new
    rails_game.choose_player_one("Human")
    rails_game.choose_player_two("RandomCPU")
    
    rails_game.start
    
    rails_game.game_state.board.should_receive(:print)
    
    rails_game.print_board
  end
end
