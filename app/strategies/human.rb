module Strategies
  module TicTacToe
    class Human
      attr_accessor :piece

      def initialize(piece = 'O')
        @piece = piece
      end

      def next_move(game)
        space = gets.chomp
        space =~ /^\d+$/ ? space.to_i - 1 : space
      end
    end
  end
end
