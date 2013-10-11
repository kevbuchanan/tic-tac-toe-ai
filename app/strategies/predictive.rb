module Strategies
  module TicTacToe
    class PredictiveAI
      attr_accessor :piece

      def initialize(piece = 'X')
        @piece = piece
      end

      def next_move(game)

      end

      def possible_moves(game)
        (0..8).select do |space|
          game.board_string[space] == game.empty_space
        end
      end
    end
  end
end
