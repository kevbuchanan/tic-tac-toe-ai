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
It progresses through taking a winning move, to a defensive move, to the first move, to a strategic move.
The primary logic is located in the #strategic_move and #find_winning_move methods.

## Extras

The Round and View classes were constructed such that they can be used with other board games with the same basic turn style of play. The extras folder includes an an additional board game that can be played through the board_game.rb file. This game uses the same Round object and inherits from the basic View object that was also used in tic tac toe.
