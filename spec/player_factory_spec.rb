require 'spec_helper'

describe "PlayerFactory" do
  it "creates a human player" do
    human = PlayerFactory.create_player(PlayerFactory::HUMAN, 'x')  
    
    human.class.should == HumanPlayer
    human.token.should == 'x'
  end
  
  it "creates a random cpu player" do
    random_cpu = PlayerFactory.create_player(PlayerFactory::RANDOM_CPU, 'x')
    
    random_cpu.class.should == CpuPlayer
    random_cpu.token.should == 'x'
    random_cpu.ai.class.should == RandomAi
  end
  
  it "creates a perfect cpu player" do
    perfect_cpu = PlayerFactory.create_player(PlayerFactory::PERFECT_CPU, 'o')
    
    perfect_cpu.class.should == CpuPlayer
    perfect_cpu.token.should == 'o'
    perfect_cpu.ai.class.should == PerfectAi
  end
end