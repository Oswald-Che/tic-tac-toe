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

  describe '#check_sigil' do
    context 'when player is 1' do
      let(:board) { double('board') }
      subject(:game_sigil) { described_class.new(board, 1)}

      it 'returns X' do
        result = game_sigil.check_sigil
        expect(result).to eq('X')
      end
    end

    context 'when player is 2' do
      let(:board) { double('board') }
      subject(:game_sigil) { described_class.new(board, 2)}

      it 'returns O' do
        result = game_sigil.check_sigil
        expect(result).to eq('O')
      end
    end
  end

  describe '#verify_input' do
    context 'when a valid input is given and postion in board is empty' do
      let(:board) { instance_double(Board, check_input?: true)}
      subject(:game_verify) { described_class.new(board) }

      it 'returns true' do
        input = '4'
        result = game_verify.verify_input(input)
        expect(result).to be true
      end
    end

    context 'when an invalid input is given' do
      subject(:game_verify) { described_class.new }

      it 'returns false' do
        invalid_input = 's'
        result = game_verify.verify_input(invalid_input)
        expect(result).to be false
      end
    end

    context 'when a valid input is given and position in board is filled' do
      let(:board) { instance_double(Board, check_input?: false) }
      subject(:game_verify) { described_class.new(board) }

      it 'returns false' do
        invalid_input = '4'
        result = game_verify.verify_input(invalid_input)
        expect(result).to be false
      end
    end
  end
  describe '#get_input' do
    context 'when user inputs a valid number' do
      subject(:game_input) { described_class.new }

      before do 
        valid_input = '5'
        allow(game_input).to receive(:input).and_return(valid_input)
      end

      it 'doesn\'t display error message' do
        expect(game_input).not_to receive(:puts)
        game_input.get_input
      end
    end

    context 'when user inputs an invalid number, then a valid number' do
      subject(:game_input) { described_class.new }

      before do
        letter = 's'
        valid_input = '5'
        allow(game_input).to receive(:input).and_return(letter, valid_input)
      end

      it 'displays error message once' do
        expect(game_input).to receive(:puts).once
        game_input.get_input
      end
    end
  end

  describe '#game_end' do
    let(:board) { instance_double(Board) }
    subject(:game_over) { described_class.new(board) }

    before do
      allow(board).to receive(:full?)
      allow(board).to receive(:game_win?)
    end

    it 'send full to board class' do
      expect(board).to receive(:full?)
      game_over.game_end
    end

    it 'send full to board class' do
      expect(board).to receive(:game_win?)
      game_over.game_end
    end
  end
  
end