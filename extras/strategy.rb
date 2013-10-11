module Strategies
  module Checkers
    class Human
      attr_reader :piece

      def initialize(piece)
        @piece = piece
      end

      def next_move(game)
        move = gets.chomp
        from = move.split(':').first.to_i - 1
        to = move.split(':').last.to_i - 1
        [from, to]
      end
    end
  end
end
