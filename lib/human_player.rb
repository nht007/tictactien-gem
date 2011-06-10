# require 'player'

class HumanPlayer < Player
  def perform_move(board)
    while true
      row = nil
      until row
        puts "Player '#{@token}', choose a row (1-3).\n"
        row_input = $stdin.gets.strip
        row = row_input.to_i if ('1'..'3').include? row_input
      end
      
      col = nil
      until col
        puts "Player '#{@token}', choose a column (1-3).\n"
        col_input = $stdin.gets.strip
        col = col_input.to_i if ('1'..'3').include? col_input
      end
      
      if board.add_piece(@token, [row-1, col-1])
        return
      end
      
      puts "Invalid move.\n"
    end
  end
end