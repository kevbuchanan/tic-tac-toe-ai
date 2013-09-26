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
          winning_move(game, piece) || defensive_move(game, piece) || first_move(game) || strategic_move(game, piece)
        end

        def winning_move(game, piece)
          find_winning_move(game, piece)
        end

        def defensive_move(game, piece)
          other_piece = other_piece(game, piece)
          find_winning_move(game, other_piece) if other_piece
        end

        def first_move(game)
          [1, 3, 5, 7].sample if game.board.scan(/[^#{game.empty_space}]/).empty?
        end

        def other_piece(game, piece)
          game.board.scan(/[^#{piece}-]/).first
        end

        def spot_number(line_index, space_index)
          LINE_INDICES[line_index][space_index]
        end

        def strategic_move(game, piece)
          lowest_line_score = 0
          move = nil
          game.lines.each_with_index do |line, line_index|
            if line_score(line, piece, game) <= lowest_line_score && line.index(game.empty_space)
              lowest_line_score = line_score(line, piece, game)
              move = spot_number(line_index, optimal_index(line, game.empty_space))
            end
          end
          move
        end

        def line_score(line, piece, game)
          line.count(piece) - line.count(other_piece(game, piece))
        end

        def optimal_index(line, empty_space)
          line[1] == empty_space ? 1 : line.index(empty_space)
        end

        def find_winning_move(game, piece)
          game.lines.each_with_index do |line, line_index|
            if line.count(piece) == 2 && line.index(game.empty_space)
              space_index = line.index(game.empty_space)
              return spot_number(line_index, space_index)
            end
          end
          nil
        end
      end
    end
  end
end
