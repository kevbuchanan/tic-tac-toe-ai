require_relative '../spec_helper'

describe Strategies::TicTacToe::KevinsAI do
  let(:ai){ Strategies::TicTacToe::KevinsAI.new('X') }

  def new_game(board)
    TicTacToe.new(board)
  end

  def possible_moves(board)
    (0..8).select do |move|
      board[move] == '-'
    end
  end

  def play_all_possibilities(game, options = {first_move: true})
    if options[:first_move]
      ai_move = ai.next_move(game)
      game.make_move(ai_move, 'X')
      return :win_or_draw if game.over?
    end
    possible_moves(game.board_string).map do |move|
      new_game = new_game(game.board_string.dup)
      new_game.make_move(move, 'O')
      if new_game.winner == 'O'
        :lose
      elsif new_game.over?
        :win_or_draw
      else
        play_all_possibilities(new_game)
      end
    end.flatten
  end

  describe '#next_move' do
    context 'there is a winning move' do
      it 'takes the winning space' do
        board = 'XX-----O-'
        expect(ai.next_move(new_game(board))).to eq(2)
      end
    end

    context 'there is a defensive move' do
      it 'blocks the winning space' do
        board = 'OO-------'
        expect(ai.next_move(new_game(board))).to eq(2)
      end
    end

    context 'there is a winning and defensive move' do
      it 'takes the winning space' do
        board = 'XX-OO----'
        expect(ai.next_move(new_game(board))).to eq(2)
      end
    end

    context 'it is the first move' do
      it 'takes an edge space' do
        board = '---------'
        expect([1, 3, 5, 7]).to include(ai.next_move(new_game(board)))
      end
    end

    context 'it must make a strategic move' do
      it 'takes a line with one opponent character' do
        board = '-X-O-----'
        expect(ai.next_move(new_game(board))).to eq(0)
      end

      it 'takes an edge space over a corner space if opposite corners are taken' do
        board = 'O---X---O'
        expect(ai.next_move(new_game(board))).to eq(5)
      end

      it 'takes a corner space if the opponent took the middle space' do
        board = '----O----'
        expect(ai.next_move(new_game(board))).to eq(2)
      end
    end
  end

  describe 'going first' do
    it 'never loses' do
      expect(play_all_possibilities(new_game('---------')).uniq).to eq([:win_or_draw])
    end
  end

  describe 'going second' do
    it 'never loses' do
      expect(expect(play_all_possibilities(new_game('---------'), first_move: false).uniq).to eq([:win_or_draw]))
    end
  end
end
