class Checkers
  attr_reader :board, :empty_space

  EMPTY_SPACE = '-'

  def initialize(*pieces)
    @empty_space = EMPTY_SPACE
    @pieces = pieces
    @board = (pieces.first + EMPTY_SPACE * 9) * 2 + (pieces.last + EMPTY_SPACE * 9) * 2
  end

  def board_string
    @board
  end

  def make_move(move, piece)
    from = move.first
    to = move.last
    piece = @board[from]
    @board[from] = EMPTY_SPACE
    @board[to] = piece unless to > 39 || to < 0
  end

  def valid_move?(move, piece)
    @board[move.first] == piece
  end

  def over?
    winner || draw?
  end

  def winner
    @pieces.find do |piece|
      @board.scan(piece).empty?
    end
  end

  def draw?
    false
  end
end
