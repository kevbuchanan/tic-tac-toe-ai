require_relative '../spec_helper'

describe Strategies::TicTacToe::Human do
  let(:human) { Strategies::TicTacToe::Human.new('X') }

  describe '#next_move' do
    before do
      human.stub(:gets).and_return('2')
    end

    it 'takes input from the command line' do
      expect(human).to receive(:gets)
      human.next_move(double(:game))
    end

    it 'returns one less than the number passed from the command line' do
      expect(human.next_move(double(:game))).to eq(1)
    end
  end
end
