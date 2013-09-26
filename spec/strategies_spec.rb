require_relative 'spec_helper'

describe Strategies::TicTacToe::Human do
  describe '#next_move' do
    before do
      subject.stub(:gets).and_return('2')
    end

    it 'takes input from the command line' do
      expect(subject).to receive(:gets)
      subject.next_move(double(:game), 'X')
    end

    it 'returns one less than the number passed from the command line' do
      expect(subject.next_move(double(:game), 'X')).to eq(1)
    end
  end
end

describe Strategies::TicTacToe::KevinsAI do

  def game(board)
    TicTacToe.new(board)
  end

  describe '#next_move' do
    context 'there is a winning move' do
      it 'takes the winning space' do
        board = 'XX-------'
        expect(subject.next_move(game(board), 'X')).to eq(2)
      end
    end

    context 'there is a defensive move' do
      it 'blocks the winning space' do
        board = 'OO-------'
        expect(subject.next_move(game(board), 'X')).to eq(2)
      end
    end

    context 'there is a winning and defensive move' do
      it 'takes the winning space' do
        board = 'XX-OO----'
        expect(subject.next_move(game(board), 'X')).to eq(2)
      end
    end

    context 'it is the first move' do
      it 'takes an edge space' do
        board = '---------'
        expect([1, 3, 5, 7]).to include(subject.next_move(game(board), 'X'))
      end
    end

    context 'it must make a strategic move' do
      it 'takes a line with one opponent character' do
        board = '-X-O-----'
        expect(subject.next_move(game(board), 'X')).to eq(0)
      end

      it 'takes an edge space over a corner space if opposite corners are taken' do
        board = 'O---X---O'
        expect(subject.next_move(game(board), 'X')).to eq(5)
      end

      it 'takes a corner space if the opponent took the middle space' do
        board = '----O----'
        expect(subject.next_move(game(board), 'X')).to eq(2)
      end
    end
  end
end
