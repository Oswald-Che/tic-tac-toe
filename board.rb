class Board

  def initialize
    @board = Array.new(9, ' ')
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

end

board = Board.new

board.display_tutorial
board.display_board