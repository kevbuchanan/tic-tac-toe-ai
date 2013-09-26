module Strategies
  module TicTacToe
    module Human
      class << self
        def next_move(game, piece)
          space = gets.chomp
          space.to_i - 1
        end
      end
    end

    module KevinsAI
      # Space indices by line: [diagonal2, diagonal1, column3, column2, column1, row3, row2, row1]
      LINE_INDICES = [[2, 4, 6], [0, 4, 8], [2, 5, 8], [1, 4, 7], [0, 3, 6], [6, 7, 8], [3, 4, 5], [0, 1, 2]]

      class << self
        def next_move(game, piece)
          first_move(game) || strategic_move(game, piece)
        end

        def first_move(game)
          [1, 3, 5, 7].sample if game.board.scan(/[^#{game.empty_space}]/).empty?
        end

        def other_piece(game, piece)
          game.board.scan(/[^#{piece}-]/).first
        end

        def strategic_move(game, piece)
          scores = line_scores(game, piece).reverse
          [2, -2, scores.min].each do |score|
            if scores.include?(score)
              index = scores.index(score)
              line = game.lines.reverse[index]
              space = optimal_space_index(line, game.empty_space)
              return spot_number(index, space)
            end
          end
        end

        def line_scores(game, piece)
          game.lines.map { |line| calculate_line_score(line, piece, game) }
        end

        def spot_number(line_index, space_index)
          LINE_INDICES[line_index][space_index]
        end

        def calculate_line_score(line, piece, game)
          return 10 unless line.index(game.empty_space)
          line.count(piece) - line.count(other_piece(game, piece))
        end

        def optimal_space_index(line, empty_space)
          line[1] == empty_space ? 1 : line.index(empty_space)
        end
      end
    end
  end
end
