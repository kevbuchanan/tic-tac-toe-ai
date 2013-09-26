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
      # Space indices by line: [row1, row2, row3, column1, column2, column3, diagonal1, diagonal2]
      LINE_INDICES = [[0, 1, 2], [3, 4, 5], [6, 7, 8], [0, 3, 6], [1, 4, 7], [2, 5, 8], [0, 4, 8], [2, 4, 6]]

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
          lowest_line_score = 0
          move = nil
          game.lines.each_with_index do |line, line_index|
            line_score = calculate_line_score(line, piece, game)
            space_index = optimal_space_index(line, game.empty_space)
            if line_score == 2
              return spot_number(line_index, space_index)
            elsif line_score <= lowest_line_score && line.index(game.empty_space)
              lowest_line_score = line_score
              move = spot_number(line_index, space_index)
            end
          end
          move
        end

        def spot_number(line_index, space_index)
          LINE_INDICES[line_index][space_index]
        end

        def calculate_line_score(line, piece, game)
          line.count(piece) - line.count(other_piece(game, piece))
        end

        def optimal_space_index(line, empty_space)
          line[1] == empty_space ? 1 : line.index(empty_space)
        end
      end
    end
  end
end
