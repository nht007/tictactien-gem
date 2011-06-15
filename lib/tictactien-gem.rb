require 'board'
require 'game'
require 'console_game'
require 'ai'
require 'player'
require 'human_player'
require 'cpu_player'
require 'minimax'
require 'perfect_ai'
require 'random_ai'
require 'player_factory'
require 'game_state'

module Tictactien
  HUMAN = PlayerFactory::HUMAN
  RANDOM_CPU = PlayerFactory::RANDOM_CPU
  PERFECT_CPU = PlayerFactory::PERFECT_CPU
  
  def self.create_player(player_type, token)
    PlayerFactory.create_player(player_type, token)
  end
  
  def self.create_new_game(active_player)
    board = Board.new
    GameState.new(board, active_player)
  end
  
  # def self.add_piece(board, player_token, location)
  #   board.add_piece(player_token, location)
  # end
end