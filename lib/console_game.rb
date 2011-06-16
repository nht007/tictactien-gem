class ConsoleGame < Game
  def start
    @players[:one] = choose_player('x')
    @players[:two] = choose_player('o')
    
    @game_state = GameState.new(@players[:one])
    
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
  
  def ask_move(board, token)
    row, col = nil, nil

    while !board.validate_move([row, col])
      puts "Player '#{token}', choose a row (1-3).\n"
      row_input = $stdin.gets.strip
      row = row_input.to_i if ('1'..'3').include? row_input

      puts "Player '#{token}', choose a column (1-3).\n"
      col_input = $stdin.gets.strip
      col = col_input.to_i if ('1'..'3').include? col_input
    end
    
    return [row-1, col-1]
  end
end
