require './lib/board.rb'

describe Board do
  describe '#initialize' do
  end

  describe '#game_win?' do
    context 'When player 1 wins' do
      subject(:board_win) { described_class.new([3, 6, 9], [1, 3] )}

      it 'wins the game' do
        expect(board_win).to be_game_win
      end

    end

    context 'when player 2 wins' do
      subject(:board_win) { described_class.new([2, 4, 8], [1, 5, 9])}

      it 'wins the game' do
        expect(board_win).to be_game_win
      end
    end

    context 'when no player wins' do
      subject(:board_win) { described_class.new([3, 7, 9], [4, 5, 8])}

      it 'wins the game' do
        expect(board_win).not_to be_game_win
      end
    end

    context 'when all possible wins are tested' do
      possible_wins = [[1, 2, 3], [4, 5, 6], [7, 8, 9], [1, 4, 7], [2, 5, 8], [3, 6, 9], [1, 5, 9], [3, 5, 7]]
      it 'all returns true' do
        possible_wins.each do |win|
          expect(described_class.new(win)).to be_game_win
        end
      end
    end


  end

  describe '#input' do
    subject(:board_input) { described_class.new}
    context 'when sigil is X' do
      it 'Add X to player 1\'s moves' do
        sigil = 'X'
        number = 3
        expect { board_input.input(number, sigil) }.to change { board_input.instance_variable_get(:@player1_moves).length }.by(1)
      end

      it 'Add sigil in board' do
        sigil = 'X'
        number = 3
        expect { board_input.input(number, sigil) }.to change { board_input.instance_variable_get(:@board)[number] }.to(sigil)
      end
    end

    context 'when sigil is O' do
      it 'Add O to player 2\'s moves' do
        sigil = 'O'
        number = 3
        expect { board_input.input(number, sigil) }.to change { board_input.instance_variable_get(:@player2_moves).length }.by(1)
      end

      it 'Add sigil in board' do
        sigil = 'X'
        number = 3
        expect { board_input.input(number, sigil) }.to change { board_input.instance_variable_get(:@board)[number] }.to(sigil)
      end
    end
  end
  describe '#check_input' do
    context 'When board postion is empty' do
      subject(:board_check) { described_class.new}

      it 'returns true' do
        num = 4
        expect(board_check.check_input?(num)).to be true
      end
    end

    context 'When board postion is filled' do
      let(:board) { ['X', 'O', 'X', 'O']}
      subject(:board_check) { described_class.new([], [], board)}

      it 'returns false' do
        num = 3
        expect(board_check.check_input?(num)).to be false
      end
    end
  end

  describe '#full?' do
    context 'When board is empty' do
      subject(:board_full) { described_class.new }
      it 'is not full' do
        expect(board_full).not_to be_full
      end
    end

    context 'When board is filled' do
      let (:board) { %w[O X X X X O O O X] }
      subject(:board_full) { described_class.new([], [], board) }
      it 'is full' do
        expect(board_full).to be_full
      end
    end
  end
end