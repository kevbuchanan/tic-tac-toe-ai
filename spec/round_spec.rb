require_relative 'spec_helper'

describe Round do
  let(:human) { Player.new('X', Strategies::TicTacToe::Human) }
  let(:ai) { Player.new('O', Strategies::TicTacToe::KevinsAI) }
  let(:game) { TicTacToe.new }
  let(:view) { TicTacToeView.new(StringIO.new) }
  let(:round) { Round.new(game, view, human, ai) }

  before do
    view.stub(:gets).and_return('')
    human.stub(:next_move).and_return(rand(0..8))
    round.stub(:save_game)
  end

  describe 'starting the round' do
    it 'chooses a random player to start the round' do
      expect([human, ai]).to include(round.current_turn)
    end

    it 'tells the view to show the start of the round' do
      expect(view).to receive(:show_start)
      game.stub(:draw?).and_return(true)
      round.start
    end
  end

  describe 'a players turn' do
    it 'gets the next move from the player' do
      expect(human).to receive(:next_move)
      game.stub(:valid_move?).and_return(true)
      game.stub(:draw?).and_return(false, false, false, true)
      round.start
    end

    it 'displays a message for an invalid move' do
      expect(view).to receive(:show_invalid_move)
      game.stub(:valid_move?).and_return(false, true)
      game.stub(:draw?).and_return(false, true)
      round.start
    end

    it 'gets another move after an invalid move' do
      expect(human).to receive(:next_move).twice
      game.stub(:valid_move?).and_return(false, true, false, true)
      game.stub(:draw?).and_return(false, false, false, true)
      round.start
    end

    it 'makes a move on the board with a valid move' do
      expect(game).to receive(:make_move)
      game.stub(:draw?).and_return(false, true)
      round.start
    end
  end

  describe 'declaring a winner' do
    before do
      game.stub(:winner).and_return(nil, 'O')
    end

    it 'identifies the correct winner' do
      round.start
      expect(round.winner).to eq(ai)
    end

    it 'displays the winner' do
      expect(view).to receive(:show_winner).with(ai)
      round.start
    end
  end

  describe 'declaring a draw' do
    it 'displays a draw' do
      expect(view).to receive(:show_draw)
      game.stub(:draw?).and_return(false, true)
      round.start
    end
  end
end
