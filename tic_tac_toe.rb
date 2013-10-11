require_relative 'app/game'
require_relative 'app/round'
require_relative 'app/strategies/human'
require_relative 'app/strategies/kevins_ai'
require_relative 'app/view'

human = Strategies::TicTacToe::Human.new()
ai = Strategies::TicTacToe::KevinsAI.new()
view = TicTacToeView.new
game = TicTacToe.new
round = Round.new(game, view, human, ai)
round.setup
