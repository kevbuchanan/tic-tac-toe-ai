require_relative 'spec_helper'

describe Player do
  let(:strategy) { Strategies::TicTacToe::Human }
  let(:player) { Player.new('X', strategy) }

  it 'has a piece' do
    expect(player.piece).to eq('X')
  end

  it 'has a strategy' do
    expect(player.strategy).to eq(strategy)
  end

  it 'delegates next move to its strategy' do
    expect(strategy).to receive(:next_move)
    player.next_move(double(:game))
  end
end
