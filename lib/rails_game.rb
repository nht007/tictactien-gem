class RailsGame < Game
  def choose_player_one(type)
    choose_player(type, 'x')
  end
  
  def choose_player_two(type)
    choose_player(type, 'o')
  end
  
  def start
    @game_state = GameState.new(@players[:one])
  end
  
  def update(move)
    @game_state.update(move)
    switch_active_player
  end
  
  private
  
  def choose_player(type, token)
    symbol = token == 'x' ? :one : :two
    
    if type == "Human"
      @players[symbol] = PlayerFactory.create_player(PlayerFactory::HUMAN, token)
    elsif type == "RandomCPU"
      @players[symbol] = PlayerFactory.create_player(PlayerFactory::RANDOM_CPU, token)
    elsif type == "PerfectCPU"
      @players[symbol] = PlayerFactory.create_player(PlayerFactory::PERFECT_CPU, token)
    end
  end
end
