require 'spec_helper'

describe "Tictactien" do
  it "creates a human player" do
    human = Tictactien.create_player(Tictactien::HUMAN, 'x')  
    
    human.class.should == HumanPlayer
    human.token.should == 'x'
  end
  
  it "creates a random cpu player" do
    random_cpu = Tictactien.create_player(Tictactien::RANDOM_CPU, 'x')
    
    random_cpu.class.should == CpuPlayer
    random_cpu.token.should == 'x'
    random_cpu.ai.class.should == RandomAi
  end
  
  it "creates a perfect cpu player" do
    perfect_cpu = Tictactien.create_player(Tictactien::PERFECT_CPU, 'o')
    
    perfect_cpu.class.should == CpuPlayer
    perfect_cpu.token.should == 'o'
    perfect_cpu.ai.class.should == PerfectAi
  end
  
  it "creates a snapshot of the current game state" do
    active_player = Player.new('x')
    
    game_state = Tictactien.create_new_game(active_player)
    
    game_state.board.should_not be_nil
    game_state.active_player.should == active_player
  end
  
  # it "adds a piece to the board" do
  #   game_state = Tictactien.create_new_game('x')
  #   location = [0,0]
  #   Tictactien.add_piece(game_state.board, game_state.active_player, location)
  #   
  #   game_state.board.grid.should == [['x', nil, nil],
  #                                    [nil, nil, nil],
  #                                    [nil, nil, nil]]
  # end
end