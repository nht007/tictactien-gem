require 'spec_helper'

describe "Minimax" do
  it "is created with a grid, a move and a player" do
    board = Board.new
    board.grid = 
           [[nil, nil, nil],
            [nil, nil, nil],
            [nil, nil, nil]]  
    last_move = [0, 0]
    current_player = Player.new('x')
    
    minimax_node = Minimax.new(board, last_move, current_player.token, current_player.token)
    
    minimax_node.board.should == board
    minimax_node.last_move.should == last_move
    
  end
  
  it "evaluates a score for a game in progress" do
    board = Board.new
    board.grid = 
           [[nil, nil, nil],
            [nil, nil, nil],
            [nil, nil, nil]]  
    
    current_player = Player.new('x')
    
    minimax_node = Minimax.new(board, nil, current_player.token, current_player.token)
    minimax_node.game_ended.should be_nil
  end
  
  it "evaluates the score for a winning game" do
    board = Board.new
    board.grid = 
           [['x', nil, nil],
            [nil, 'x', nil],
            [nil, nil, 'x']]  
    
    current_player = Player.new('x')
    
    minimax_node = Minimax.new(board, nil, current_player.token, current_player.token)
    minimax_node.game_ended.should == 1
  end
  
  it "evaluates the score for a losing game" do
    board = Board.new
    board.grid = 
           [[nil, nil, nil],
            ['o', 'o', 'o'],
            [nil, nil, nil]]  
    
    current_player = Player.new('x')
    
    minimax_node = Minimax.new(board, nil, current_player.token, current_player.token)
    minimax_node.game_ended.should == -1
  end
  
  it "evaluates the score for a cat game" do
    board = Board.new
    board.grid = 
           [['x', 'x', 'o'],
            ['o', 'o', 'x'],
            ['x', 'o', 'x']]  
    
    current_player = Player.new('x')
    
    minimax_node = Minimax.new(board, nil, current_player.token, current_player.token)
    minimax_node.game_ended.should == 0
  end
  
  it "correctly evaluates the score of a sure game" do
    board = Board.new
    board.grid = 
           [['x', 'x', nil],
            ['o', 'o', 'x'],
            ['o', 'o', 'x']]  
    
    current_player = Player.new('x')
    
    minimax_node = Minimax.new(board, nil, current_player.token, current_player.token)
    minimax_node.build_tree
    
    minimax_node.score.should == 1
  end
  
  it "correctly evaluates the score of a cat game" do
    board = Board.new
    board.grid = 
           [['x', 'x', 'o'],
            ['o', 'o', 'x'],
            ['x', 'o', nil]]  
    
    current_player = Player.new('x')
    
    minimax_node = Minimax.new(board, nil, current_player.token, current_player.token)
    minimax_node.build_tree
    
    minimax_node.score.should == 0
  end

  it "correctly evaluates the score of a lost game" do
    board = Board.new
    board.grid = 
           [['x', 'x', nil],
            ['x', 'o', 'o'],
            [nil, 'o', 'x']]  
    
    current_player = Player.new('o')
    
    minimax_node = Minimax.new(board, nil, current_player.token, current_player.token)
    minimax_node.build_tree
    
    minimax_node.score.should == -1
  end
  
  it "gets the next best move" do
    board = Board.new
    board.grid = 
           [['x', 'x', nil],
            [nil, 'o', nil],
            [nil, nil, nil]]
    
    current_player = Player.new('o')
    
    minimax_node = Minimax.new(board, nil, current_player.token, current_player.token)
    minimax_node.build_tree
    minimax_node.get_next_move.should == [0,2]
  end
end