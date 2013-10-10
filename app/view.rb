require 'colorize'

class View
  def initialize(output = STDOUT)
    @output = output
  end

  def clear_screen
    @output.puts "\e[H\e[2J"
  end

  def show_start(player)
    clear_screen
    @output.puts player.piece + " wins the coin flip and goes first."
    @output.puts "Press enter to start."
    gets.chomp
  end

  def show_turn(player)
    @output.puts player.piece + " your move.\nType a space number and press enter."
  end

  def show_invalid_move(game, player)
    clear_screen
    @output.puts 'Invalid move'
    sleep 1
    print_board(game)
    show_turn(player)
  end

  def show_winner(player)
    @output.puts player.piece + ' won!'
  end

  def show_draw
    @output.puts 'Game is a draw.'
  end

  def show_record(record)
    @output.puts "\nWin Tally"
    record.each do |name, wins|
      @output.puts "#{name}: #{wins}"
    end
  end
end

class TicTacToeView < View
  def print_board(game)
    clear_screen
    game.board_string.split(//).each_with_index do |space, index|
      @output.print '| '
      space == game.empty_space ? (@output.print (index + 1).to_s.colorize(:green)) : (@output.print space.colorize(:red))
      @output.print ' '
      @output.print "|\n-------------\n" if index % 3 == 2 && index != 8
      @output.print "|\n\n" if index == 8
    end
  end
end
