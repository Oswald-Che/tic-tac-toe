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

    
  end



end