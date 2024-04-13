class Board

  def initialize
    @board = Array.new(9, ' ')
    @winning_set = [[1, 2, 3], [4, 5, 6], [7, 8, 9], [1, 4, 7], [2, 5, 6], [3, 6, 9], [1, 5, 9], [3, 5, 7]]
    @moves_played = []
  end

  def display_tutorial
    puts " 1 | 2 | 3 \n-----------\n 4 | 5 | 6 \n-----------\n 7 | 8 | 9 "
  end

  def display_board
    @board.each_slice(3) do |a, b, c|
      puts " #{a} | #{b} | #{c} "
      puts '-----------'
    end
  end

  def game_win?
    won = false
    @winning_set.each do |set|
      if (moves_played & set) == set
        won = true
      end
    end
    won
  end

  def input(number, sigil)
    @board[number] = sigil
    @moves_played.push[number]
  end

  def check_input?(number)
    @board[number] == ' '
  end

  def full?
    @board.none?
  end
  
end
