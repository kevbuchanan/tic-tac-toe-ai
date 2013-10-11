require_relative '../spec_helper'

describe Strategies::TicTacToe::PredictiveAI do
  let(:ai){ Strategies::TicTacToe::PredictiveAI.new('X') }

  def new_game(board)
    TicTacToe.new(board)
  end

  describe '#possible_moves' do
    it 'returns the possible moves on a board' do
      game = new_game('XX--OO---')
      expect(ai.possible_moves(game)).to eq([2, 3, 6, 7, 8])
    end
  end

  describe '#next_move' do
  end
end
