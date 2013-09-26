# Unbeatable Tic Tac Toe AI

This is an unbeatable tic tac toe AI. The game itself is played through the command line.

Before playing, use bundle install to install the colorize gem that is used for display purposes.

To start a game, run:
```
  ruby tic_tac_toe.rb
```

The game progresses as follows:

- One player is randomly selected to go first (a coin-flip)
- You enter a move by typing a space number and pressing enter
- The program will notify you of an invalid move
- Turns alternate after a valid move
- The game ends with a win or a draw and displays the total number of draws and wins for either player

## AI

The AI is located in the Strategies::TicTacToe::KevinsAI module.
It progresses through taking the first move, to a winning move, to a defensive move, to a strategic move.
The primary logic is located in the #strategic_move method. It progress through the lines of the board starting with the diagonals in order to take a corner space if the middle is taken.

## Structure

The program has 5 main components, which can be found in the 'app' directory.

- The TicTacToe class that serves as the game board and rules
- The Player class, which keeps track of its game piece and gives the next move for the round
- The Strategies module, to which a player delegates its next move, and includes a Human and AI strategy
- The View class that displays output to the command line
- The Round class that serves as a controller for the flow of the game

## Spec

You can run and see all specs by using:
```
  rspec spec --format documentation
```

## Extras

The Round and View classes were constructed such that they can be used with other board games with the same basic turn style of play. The 'extras' directory includes an an additional board game that can be played through the board_game.rb file. This game uses the same Round object and inherits from the basic View object that was also used in tic tac toe.
