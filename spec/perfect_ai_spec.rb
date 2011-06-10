require 'spec_helper'

describe "PerfectAi" do  
  it "calculates a perfect move 1" do
    perfect_ai = PerfectAi.new
    board = Board.new
    current_player = Player.new('x')
    
    perfect_ai.calculate_move(board, current_player).should == [0,0]
  end
  
  it "calculates a perfect move 2" do
    perfect_ai = PerfectAi.new
    board = Board.new
    current_player = Player.new('o')
    
    board.grid = [['x', nil, nil],
                  [nil, nil, nil],
                  [nil, nil, nil]]
    
    perfect_ai.calculate_move(board, current_player).should == [1,1]
  end
  
  it "calculates a perfect move 3" do
    perfect_ai = PerfectAi.new
    board = Board.new
    current_player = Player.new('x')
    
    board.grid = [['x', nil, nil],
                  [nil, 'o', nil],
                  [nil, nil, nil]]
    
    perfect_ai.calculate_move(board, current_player).should == [0,1]
  end
end