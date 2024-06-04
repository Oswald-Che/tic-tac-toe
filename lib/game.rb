require_relative 'board.rb'

class Game
  attr_reader :player

  def initialize(board = Board.new, player = 1)
    @board = board
    @player = player
  end

  def start
    introduction
    play until game_end
    final_message
  end

  def introduction
    puts 'Welcome to Tic Tac toe'
    puts 'Player 1 is X and Player 2 is O'
    @board.display_tutorial
    puts 'This is How to play the game'
  end

  def play
    puts "\nplayer #{player}'s turn"
    @board.input(get_input, check_sigil)
    @board.display_board
    swap_player
  end

  def swap_player
    @player == 1 ? 2 : 1
  end

  def check_sigil
    player == 1 ? 'X' : 'O'
  end

  def get_input
    number = input
    return number.to_i - 1 if verify_input(number)

    puts "Please input a number between 1 to 9\nOr choose an empty square\n"
    get_input
  end

  def verify_input(number)
    number.match?(/^[1-9]$/) && @board.check_input?(number.to_i)
  end

  def game_end
    @board.full? || @board.game_win?
  end

  def final_message
    if @board.game_win?
      puts "congratulations to Player #{player} for winning the game"
      puts 'Game Over'
    elsif @board.full?
      puts 'Board is full, No space left'
      puts 'Result is DRAW'
      puts 'Game Over!!!'
    end
  end

  private

  def input
    gets.chomp
  end

end
