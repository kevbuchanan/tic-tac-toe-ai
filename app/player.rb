class Player
  attr_reader :piece, :strategy

  def initialize(piece, strategy)
    @piece = piece
    @strategy = strategy
  end

  def next_move(game)
    @strategy.next_move(game, @piece)
  end
end
