require_relative 'board.rb'

class Game
  def initialize
    @board = Board.new
  end

  def introduction
    puts 'Welcome to Tic Tac toe'
    puts 'Player 1 is X and Player 2 is O'
    @board.display_tutorial
    puts 'This is How to play the game'
  end

  def play
    player = 1
    loop do
      puts "player #{var}'s turn"
      @board.input(get_input, check_sigil(var))
      @board.display_board
      break if game_end

      player = check_player(player)
    end
  end

end

