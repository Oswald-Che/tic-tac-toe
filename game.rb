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
      puts "player #{player}'s turn"
      @board.input(get_input, check_sigil(player))
      @board.display_board
      break if game_end(player)

      player = swap_player(player)
    end
  end

  def swap_player(player)
    player == 1 ? 2 : 1
  end

  def check_sigil(player)
    player == 1 ? 'X' : 'O'
  end

  def get_input
    input = gets.chomp
    unless input.match?(/[1-9]/) && @board.check_input?(input.to_i)
      puts 'Please input a number between 1 to 9'
      input = get_input
    end
    input.to_i - 1
  end

  def game_end(player)
    if @board.full?
      puts 'Board is full, No space left'
      puts 'Result is DRAW'
      puts 'Game Over!!!'
      return true
    elsif @board.game_win?
      puts "congratulations for Player #{player} for winning the game"
      puts 'Game Over'
      return true
    end
  end

end

game = Game.new
game.introduction
game.play