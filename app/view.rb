require 'colorize'

class View
  def clear_screen
    puts "\e[H\e[2J"
  end

  def show_start(player)
    clear_screen
    puts player.piece + " wins the coin flip and goes first."
    puts "Press enter to start."
    sleep until !gets.chomp.nil?
  end

  def show_turn(player)
    puts player.piece + " your move.\nType a space number and press enter."
  end

  def show_invalid_move(game, player)
    clear_screen
    puts 'Invalid move'
    sleep 1
    print_board(game)
    show_turn(player)
  end

  def show_winner(player)
    puts player.piece + ' won!'
  end

  def show_draw
    puts 'Game is a draw.'
  end

  def show_record(record)
    puts "\nWin Tally"
    record.each do |name, wins|
      puts "#{name}: #{wins}"
    end
  end
end

class TicTacToeView < View
  def print_board(game)
    clear_screen
    game.board.split(//).each_with_index do |space, index|
      print '| '
      space == game.empty_space ? (print (index + 1).to_s.colorize(:green)) : (print space.colorize(:red))
      print ' '
      print "|\n-------------\n" if index % 3 == 2 && index != 8
      print "|\n\n" if index == 8
    end
  end
end
