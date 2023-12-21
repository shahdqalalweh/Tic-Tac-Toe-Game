import 'dart:io';

class TicTacToe {
  List<String> board;
  String currentPlayer;
  int moves;

  TicTacToe() : board = List.filled(9, ' '), currentPlayer = 'X', moves = 0;
  //To draw the external structure of the board
  void printBoard() {
    for (var i = 0; i < 9; i += 3) {
      print(board.sublist(i, i + 3).join(' | '));
      if (i < 6) print('---------');
    }
  }
//To verify the number entered for the movement and move or stop
  bool makeMove(int position) {
    if (position < 1 || position > 9 || board[position - 1] != ' ') {
      print('Invalid move. Try again.');
      return false;
    }

    board[position - 1] = currentPlayer;
    moves++;
//To check the win in every move
    if (checkWin() || checkDraw()) {
      printBoard();
      print('Game Over!');
      return true;
    }

    currentPlayer = (currentPlayer == 'X') ? 'O' : 'X';
    return false;
  }
//To check the win
  bool checkWin() {
    // Check rows, columns, and diagonals for a win
    for (var i = 0; i < 3; i++) {
      if (board[i] != ' ' &&
          board[i] == board[i + 3] &&
          board[i + 3] == board[i + 6]) {
        printBoard();
        print('Player $currentPlayer wins!');
        return true;
      }

      if (board[i * 3] != ' ' &&
          board[i * 3] == board[i * 3 + 1] &&
          board[i * 3 + 1] == board[i * 3 + 2]) {
        printBoard();
        print('Player $currentPlayer wins!');
        return true;
      }
    }

    if (board[0] != ' ' && board[0] == board[4] && board[4] == board[8]) {
      printBoard();
      print('Player $currentPlayer wins!');
      return true;
    }

    if (board[2] != ' ' && board[2] == board[4] && board[4] == board[6]) {
      printBoard();
      print('Player $currentPlayer wins!');
      return true;
    }

    return false;
  }

  bool checkDraw() {
    if (moves == 9) {
      printBoard();
      print('It\'s a draw!');
      return true;
    }
    return false;
  }

  void restartGame() {
    board = List.filled(9, ' ');
    currentPlayer = 'X';
    moves = 0;
  }
}

void main() {
  TicTacToe game = TicTacToe();

  do {
    print('\nCurrent Board:');
    game.printBoard();
    print('Player ${game.currentPlayer}, enter your move (1-9): ');

    try {
      int move = int.parse(stdin.readLineSync()!);
      if (game.makeMove(move)) {
        print('Do you want to play again? (yes/no)');
        String playAgain = stdin.readLineSync()!.toLowerCase();
        if (playAgain == 'yes') {
          game.restartGame();
        } else {
          print('Thanks for playing!');
          break;
        }
      }
    } catch (e) {
      print('Invalid input. Please enter a number.');
    }
  } while (true);
}
