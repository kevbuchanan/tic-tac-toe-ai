require_relative 'app/game'
require_relative 'app/player'
require_relative 'app/round'
require_relative 'app/strategies'
require_relative 'app/view'

human = Player.new('O', Strategies::TicTacToe::Human)
ai = Player.new('X', Strategies::TicTacToe::KevinsAI)
game = TicTacToe.new
view = TicTacToeView.new
round = Round.new(game, view, human, ai)
round.start
