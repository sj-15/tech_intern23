import 'package:flutter/material.dart';

import '../../utils/utils.dart';

class OfflineGameMethods extends ChangeNotifier {
  List<String> boardElements = ['', '', '', '', '', '', '', '', ''];
  late int filledBoxes = 0;
  late int score1 = 0;
  late int score2 = 0;

  void checkWinner(BuildContext context, String currentPlayer) {
    String winner = '';

    // Checking rows
    if (boardElements[0] == boardElements[1] &&
        boardElements[0] == boardElements[2] &&
        boardElements[0] != '') {
      winner = boardElements[0];
    }
    if (boardElements[3] == boardElements[4] &&
        boardElements[3] == boardElements[5] &&
        boardElements[3] != '') {
      winner = boardElements[3];
    }
    if (boardElements[6] == boardElements[7] &&
        boardElements[6] == boardElements[8] &&
        boardElements[6] != '') {
      winner = boardElements[6];
    }

    // Checking Column
    if (boardElements[0] == boardElements[3] &&
        boardElements[0] == boardElements[6] &&
        boardElements[0] != '') {
      winner = boardElements[0];
    }
    if (boardElements[1] == boardElements[4] &&
        boardElements[1] == boardElements[7] &&
        boardElements[1] != '') {
      winner = boardElements[1];
    }
    if (boardElements[2] == boardElements[5] &&
        boardElements[2] == boardElements[8] &&
        boardElements[2] != '') {
      winner = boardElements[2];
    }

    // Checking Diagonal
    if (boardElements[0] == boardElements[4] &&
        boardElements[0] == boardElements[8] &&
        boardElements[0] != '') {
      winner = boardElements[0];
    }
    if (boardElements[2] == boardElements[4] &&
        boardElements[2] == boardElements[6] &&
        boardElements[2] != '') {
      winner = boardElements[2];
    } else if (filledBoxes == 9 && winner == '') {
      winner = '';
    }

    if (winner == '' && filledBoxes == 9) {
      showGameDialog(context, 'Draw');
    } else if (winner == 'X') {
      score1++;
      showGameDialog(context, 'X');
    } else if (winner == 'O') {
      score2++;
      showGameDialog(context, 'O');
    }
  }

  void clearBoard() {
    for (int i = 0; i < boardElements.length; i++) {
      boardElements[i] = '';
      notifyListeners();
    }
    filledBoxes = 0;
  }
}
