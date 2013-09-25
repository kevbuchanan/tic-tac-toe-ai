class CheckersView < View
  def print_board(game)
    clear_screen
    game.board.scan(/.{10}/).each_with_index do |spaces, index|
      spaces.chars.each { |space| print space + "  " }
      print "\n"
      (1 + (index * 10)).upto(10 + (index * 10)) { |x| print x.to_s + (x.to_s.length == 1 ? "  " : " ") }
      print "\n"
    end
  end

  def show_turn(player)
    puts player.piece + " your move.\nType a beginning space number and an end space separated by a colon. Example,  1:2"
  end
end
