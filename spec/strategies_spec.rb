require_relative 'spec_helper'

describe Strategies::TicTacToe::Human do
  describe '#next_move' do
    it 'takes input from the command line' do
      subject.stub(:gets).and_return('2')
      expect(subject).to receive(:gets)
      subject.next_move(double(:game), 'X')
    end

    it 'returns one less than the number passed from the command line' do
      subject.stub(:gets).and_return('2')
      expect(subject.next_move(double(:game), 'X')).to eq(1)
    end
  end
end

describe Strategies::TicTacToe::KevinsAI do
  let(:game) { double(:tic_tac_toe) }

  before do
    game.stub(:empty_space).and_return('-')
  end

  describe '#next_move' do
    context 'there is a winning move' do
      it 'takes the winning space' do
        game.stub(:lines).and_return([%w{X X -}, %w{- - -}, %w{- - -}, %w{- - -}, %w{- - -}, %w{- - -}, %w{- - -}, %w{- - -}])
        expect(subject.next_move(game, 'X')).to eq(2)
      end
    end

    context 'there is a defensive move' do
      it 'blocks the winning space' do
        game.stub(:board).and_return('OO-------')
        game.stub(:lines).and_return([%w{O O -}, %w{- - -}, %w{- - -}, %w{- - -}, %w{- - -}, %w{- - -}, %w{- - -}, %w{- - -}])
        expect(subject.next_move(game, 'X')).to eq(2)
      end
    end

    context 'there is a winning and defensive move' do
      it 'takes the winning space' do
        game.stub(:lines).and_return([%w{X X -}, %w{O O -}, %w{- - -}, %w{X O -}, %w{X O -}, %w{X O -}, %w{- O -}, %w{- - -}])
        expect(subject.next_move(game, 'X')).to eq(2)
      end
    end

    context 'it is the first move' do
      it 'takes an edge space' do
        game.stub(:board).and_return('---------')
        game.stub(:lines).and_return([%w{- - -}, %w{- - -}, %w{- - -}, %w{- - -}, %w{- - -}, %w{- - -}, %w{- - -}, %w{- - -}])
        expect([1, 3, 5, 7]).to include(subject.next_move(game, 'X'))
      end
    end

    context 'it must make a strategic move' do
      it 'takes a line with one opponent character' do
        game.stub(:board).and_return('-X-O-----')
        game.stub(:lines).and_return([%w{- X -}, %w{O - -}, %w{- - -}, %w{- O -}, %w{X - -}, %w{- - -}, %w{- - -}, %w{- - -}])
        expect(subject.next_move(game, 'X')).to eq(0)
      end

      it 'takes an edge space over a corner space' do
        game.stub(:board).and_return('O---X---O')
        game.stub(:lines).and_return([%w{O - -}, %w{- X -}, %w{- - O}, %w{O - -}, %w{- X -}, %w{- - O}, %w{O X O}, %w{- X -}])
        expect(subject.next_move(game, 'X')).to eq(5)
      end
    end
  end
end
