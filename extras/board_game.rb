require_relative '../app/round'
require_relative '../app/view'
require_relative 'checkers'
require_relative 'view'
require_relative 'strategy'

human = Strategies::Checkers::Human.new('O')
ai = Strategies::Checkers::Human.new('X')
game = Checkers.new('X', 'O')
view = CheckersView.new
round = Round.new(game, view, human, ai)
round.start
