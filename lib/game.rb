# require 'board'

class Game
  attr_accessor :players, :game_state  
  
  def initialize
    @players = {:one => nil, :two => nil}
  end
  
  def switch_active_player
    if @game_state.active_player == @players[:one]
      @game_state.active_player = @players[:two]
    elsif @game_state.active_player == @players[:two]
      @game_state.active_player = @players[:one]
    end
  end
  
  def check_win
    @game_state.check_win
  end
  
  def active_player_class
    @game_state.active_player_class
  end
end
