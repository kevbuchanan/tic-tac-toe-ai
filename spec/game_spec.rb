require_relative 'spec_helper'

describe TicTacToe do
  let(:new_board) { '---------' }
  let(:new_game) { TicTacToe.new }
  let(:preset_board) { '----X-O--' }
  let(:preset_game) { TicTacToe.new(preset_board) }
  let(:won_game) { TicTacToe.new('XXX------') }
  let(:draw_game) { TicTacToe.new('XXOOOXXOO') }

  describe '#initialize' do
    context 'when passed a board string' do
      it 'does not throw an error' do
        expect{ preset_game }.to_not raise_error
      end

      it 'assigns the board to @board' do
        expect(preset_game.board_string).to eq(preset_board)
      end
    end

    context 'when not passed a board string' do
      it 'does not throw an error' do
        expect{ new_game }.to_not raise_error
      end

      it 'assigns an empty board to @board' do
        expect(new_game.board_string).to eq(new_board)
      end
    end
  end

  describe '#board_string' do
    it 'returns a string representation of the board' do
      expect(new_game.board_string).to eq('---------')
    end
  end

  describe '#make_move' do
    it 'sets the board space as the correct character' do
      new_game.make_move(0, 'X')
      expect(new_game.board_string[0]).to eq('X')
    end
  end

  describe '#valid_move?' do
    context 'invalid move' do
      it 'returns false' do
        expect(preset_game.valid_move?(4, 'X')).to be_false
      end
    end

    context 'valid move' do
      it 'returns true' do
        expect(preset_game.valid_move?(0, 'O')).to be_true
      end
    end
  end

  describe '#over?' do
    context 'the game is over' do
      it 'returns true' do
        expect(won_game.over?).to be_true
      end
    end

    context 'the game is not over' do
      it 'returns false' do
        expect(new_game.over?).to be_false
      end
    end
  end

  describe '#winner' do
    context 'there is a winner' do
      it 'returns the winning piece' do
        expect(won_game.winner).to eq('X')
      end
    end

    context 'there is not a winner' do
      it 'returns false' do
        expect(new_game.winner).to be_nil
      end
    end
  end

  describe '#draw?' do
    context 'the game is a draw' do
      it 'returns true' do
        expect(draw_game.draw?).to be_true
      end
    end

    context 'the game is not a draw' do
      it 'returns false' do
        expect(new_game.draw?).to be_false
      end
    end
  end

  describe '#lines' do
    it 'returns the rows, columns, and diagonals' do
      expect(preset_game.lines).to eq([['-', '-', '-'], ['-', 'X', '-'], ['O', '-', '-'], ['-', '-', 'O'],
                                      ['-', 'X', '-'], ['-', '-', '-'], ['-', 'X', '-'], ['-', 'X', 'O']])
    end
  end
end
