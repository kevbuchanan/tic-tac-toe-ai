class TicTacToe
  attr_reader :board, :empty_space

  EMPTY_SPACE = '-'

  def initialize(board = EMPTY_SPACE * 9)
    @board = board
    @empty_space = EMPTY_SPACE
  end

  def make_move(space, symbol)
    @board[space] = symbol
  end

  def valid_move?(space, symbol)
    @board[space] == EMPTY_SPACE
  end

  def winner
    lines.find do |line|
      return line[0] if line.uniq.size == 1 && line[0] != EMPTY_SPACE
    end
    nil
  end

  def draw?
    @board.scan(EMPTY_SPACE).empty?
  end

  def lines
    rows + columns + diagonals
  end

  def rows
    @board.partition(/(?<=.{3}).{3}/).map { |group| group.split(//) }
  end

  def columns
    rows.transpose
  end

  def diagonals
    [[0, 4, 8], [2, 4, 6]].map do |diagonal|
      diagonal.map { |index| @board[index] }
    end
  end
end
