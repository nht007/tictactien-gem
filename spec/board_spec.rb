require 'spec_helper'

describe "Board" do    
  
  it "returns its new grid" do
    board = Board.new
    board.grid.should == [[nil, nil, nil],
                          [nil, nil, nil],
                          [nil, nil, nil]]
  end
  
  ['x', 'o'].each do |player_token|
    [
      [[], [[0,0],[0,1],[0,2],[1,0],[1,1],[1,2],[2,0],[2,1],[2,2]]],
      [[[0,0]], [[0,1],[0,2],[1,0],[1,1],[1,2],[2,0],[2,1],[2,2]]],
      [[[0,0],[0,1],[0,2]], [[1,0],[1,1],[1,2],[2,0],[2,1],[2,2]]],
      [[[0,0],[0,1],[0,2],[1,0]], [[1,1],[1,2],[2,0],[2,1],[2,2]]],
      [[[0,0],[0,1],[0,2],[1,0],[1,1]], [[1,2],[2,0],[2,1],[2,2]]],
      [[[0,0],[0,1],[0,2],[1,0],[1,1],[1,2]], [[2,0],[2,1],[2,2]]],
      [[[0,0],[0,1],[0,2],[1,0],[1,1],[1,2],[2,0]], [[2,1],[2,2]]],
      [[[0,0],[0,1],[0,2],[1,0],[1,1],[1,2],[2,0],[2,1]], [[2,2]]],
      [[[0,0],[0,1],[0,2],[1,0],[1,1],[1,2],[2,0],[2,1],[2,2]], []],
    ].each do |pieces, spaces|
      it "finds available spaces" do
        board = Board.new
        pieces.each do |piece|
          board.add_piece(player_token, piece)
        end
        board.available_spaces.should == spaces
      end
    end
  end
  
  ['x', 'o'].each do |player_token|    
    [
      [[0,0], [[player_token, nil, nil], [nil, nil, nil], [nil, nil, nil]]],
      [[0,1], [[nil, player_token, nil], [nil, nil, nil], [nil, nil, nil]]],
      [[0,2], [[nil, nil, player_token], [nil, nil, nil], [nil, nil, nil]]],
      [[1,0], [[nil, nil, nil], [player_token, nil, nil], [nil, nil, nil]]],
      [[1,1], [[nil, nil, nil], [nil, player_token, nil], [nil, nil, nil]]],
      [[1,2], [[nil, nil, nil], [nil, nil, player_token], [nil, nil, nil]]],
      [[2,0], [[nil, nil, nil], [nil, nil, nil], [player_token, nil, nil]]],
      [[2,1], [[nil, nil, nil], [nil, nil, nil], [nil, player_token, nil]]],
      [[2,2], [[nil, nil, nil], [nil, nil, nil], [nil, nil, player_token]]],
    ].each do |location, grid|    
      it "adds a piece to its grid at loc #{location.first},#{location.last}" do
        board = Board.new
        board.add_piece(player_token, location)
        board.grid.should == grid
      end
    end
  end
  
  ['x', 'o'].each do |player_token|
    [
      [[], nil],
      [[[0,0],[1,1],[2,2]], player_token],
      [[[0,2],[1,1],[2,0]], player_token],
      [[[0,0],[0,1],[0,2]], player_token],
      [[[1,0],[1,1],[1,2]], player_token],
      [[[2,0],[2,1],[2,2]], player_token],
      [[[0,0],[1,0],[2,0]], player_token],
      [[[0,1],[1,1],[2,1]], player_token],
      [[[0,2],[1,2],[2,2]], player_token],
    ].each do |pieces, result|
        it "checks for a winning player" do
        board = Board.new
        pieces.each do |piece|
          board.add_piece(player_token, piece)
        end
        board.calculate_win.should == result
      end
    end
  end
end