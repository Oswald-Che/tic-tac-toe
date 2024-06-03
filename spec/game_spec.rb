require './lib/game.rb'

# Test written for game class

describe Game do
  describe '#initialize' do

  end

  describe '#play' do
    let(:board) { instance_double(Board)}
    subject(:game_play) { described_class.new(board)}

    before do 
      allow(game_play).to receive(:puts)
      allow(game_play).to receive(:input)
      allow(game_play).to receive(:get_input)
      allow(game_play).to receive(:check_sigil)
      allow(game_play).to receive(:swap_player)
      allow(board).to receive(:input)
      allow(board).to receive(:display_board) 
    end

    it 'sends display_board to board' do
      expect(board).to receive(:display_board)
      game_play.play
    end

    it 'sends input' do
      expect(board).to receive(:input)
      game_play.play
    end
  end

  describe '#swap_player' do
    context 'when player is 1' do
      let(:board) { double('board') }
      subject(:game_swap) { described_class.new(board, 1)}

      it 'returns 2' do
        result = game_swap.swap_player
        expect(result).to eq(2)
      end
    end

    context 'when player is 2' do
      let(:board) { double('board') }
      subject(:game_swap) { described_class.new(board, 2)}

      it 'returns 1' do
        result = game_swap.swap_player
        expect(result).to eq(1)
      end
    end
  end
end