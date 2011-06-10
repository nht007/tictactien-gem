class ConsoleGame < Game
  def start
    @players[:one] = choose_player('x')
    @players[:two] = choose_player('o')
    
    @game_state = GameState.new(Board.new, @players[:one])
    
    game_loop
  end
  
  private
  
  def game_loop
    running = true
    
    while running
      @game_state.board.print

      winner = @game_state.board.calculate_win
      if winner
        puts "Player '#{winner}' wins!"
        running = false
        break
      end
      
      @game_state.active_player.perform_move(@game_state.board)
      switch_active_player
    end
  end
  
  def choose_player(token)
    while true
      puts "Please choose the player type for '#{token}':\n1. Human\n2. CPU\n"
      input = $stdin.gets.strip
      
      if input == "1"
        return PlayerFactory.create_player(PlayerFactory::HUMAN, token)
        
      elsif input == "2"
        return choose_ai(token)        
        break
      else
        puts "Invalid input. Please try again."
      end
    end
  end
  
  def choose_ai(token)
    while true
      puts "Please choose the AI type for '#{token}':\n1. Perfect\n2. Random\n"
      ai_input = $stdin.gets.strip
      
      if ai_input == "1"
        return PlayerFactory.create_player(PlayerFactory::PERFECT_CPU, token)
      elsif ai_input == "2"
        return PlayerFactory.create_player(PlayerFactory::RANDOM_CPU, token)
      else
        puts "Invalid input. Please try again."
      end
    end
  end
end