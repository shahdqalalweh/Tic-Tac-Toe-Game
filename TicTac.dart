import 'dart:io';

bool winner = false, flag = true;
int count = 0;
//List for numbers from 1 to 9
List<String> list = ['1', '2', '3', '4', '5', '6', '7', '8', '9'];
//List for All possible possibilities to win
List<String> comp = ['012', '048', '036', '147', '246', '258', '345', '678'];


void main(List<String> args) {
  printBoard();
  user();
}

void  printBoard() {
  //function to print shape of board
   print('---+---+---');
  print('| ${list[0]}  | ${list[1]} | ${list[2]} |');
  print('---+---+---');
  print('| ${list[3]}  | ${list[4]} | ${list[5]} |');
  print('---+---+---');
  print('| ${list[6]}  | ${list[7]} | ${list[8]} |');
  print('---+---+---');
}

void user() {
  //function for input users to play 
  print('Choose Number For ${flag ? 'X' : 'O'}');
  int num = int.parse(stdin.readLineSync()!);
  list[num - 1] = flag ? 'X' : 'O';
  count++;
  flag = !flag;
  if (count == 9) {
    winner=true;
    print('DRAW ...');
  } else {
    printBoard();
  }
  check_winner('X');
  check_winner('O');
  if(winner==false){
    user();
  }
}

bool check(String a, String b) {
  List<int> n = a.split('').map((k) {
    return int.parse(k);
  }).toList();
  for (final item in n) {
    if (list[item] != b) {
      return false;
    }
  }
  return true;
}


void check_winner(player) {
  for (final item in comp) {
    bool c = check(item, player);
    if(c){
      winner=true;
      print('$player WON ....');
      return;
    }
  }
}
    } catch (e) {
      print('Invalid input. Please enter a number.');
    }
  } while (true);
}
