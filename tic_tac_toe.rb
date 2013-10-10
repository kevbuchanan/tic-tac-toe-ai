require_relative 'app/game'
require_relative 'app/round'
require_relative 'app/strategies'
require_relative 'app/view'

human = Strategies::TicTacToe::Human.new('O')
ai = Strategies::TicTacToe::KevinsAI.new('X')
game = TicTacToe.new
view = TicTacToeView.new
round = Round.new(game, view, human, ai)
round.start
