require_relative '../app/player'
require_relative '../app/round'
require_relative '../app/view'
require_relative 'checkers'
require_relative 'view'
require_relative 'strategy'

human = Player.new('O', Strategies::Checkers::Human)
ai = Player.new('X', Strategies::Checkers::Human)
game = Checkers.new('X', 'O')
view = CheckersView.new
round = Round.new(game, view, human, ai)
round.start
