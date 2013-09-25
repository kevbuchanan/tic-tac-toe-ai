module Strategies
  module Checkers
    module Human
      class << self
        def next_move(game, piece)
          move = gets.chomp
          from = move.split(':').first.to_i - 1
          to = move.split(':').last.to_i - 1
          [from, to]
        end
      end
    end
  end
end
