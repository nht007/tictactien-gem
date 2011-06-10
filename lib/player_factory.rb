# require 'human_player'
# require 'cpu_player'
# require 'random_ai'
# require 'perfect_ai'

class PlayerFactory
  HUMAN = 0
  RANDOM_CPU = 1
  PERFECT_CPU = 2
  
  def self.create_player(player_type, token)
    if player_type == HUMAN
      return HumanPlayer.new(token)
    elsif player_type == RANDOM_CPU
      return CpuPlayer.new(token, RandomAi.new)
    elsif player_type == PERFECT_CPU
      return CpuPlayer.new(token, PerfectAi.new)
    end
  end
end