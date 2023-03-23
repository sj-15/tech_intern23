import 'package:flutter/material.dart';

class TicTacToeGame extends StatefulWidget {
  const TicTacToeGame({super.key});

  @override
  _TicTacToeGameState createState() => _TicTacToeGameState();
}

class _TicTacToeGameState extends State<TicTacToeGame> {
  late List<String> board;
  late String player;
  late bool gameEnded;

  @override
  void initState() {
    super.initState();
    startNewGame();
  }

  void startNewGame() {
    setState(() {
      board = List.filled(9, '');
      player = 'X';
      gameEnded = false;
    });
  }

  void makeMove(int index) {
    if (board[index] == '') {
      setState(() {
        board[index] = player;
        player = player == 'X' ? 'O' : 'X';
        checkForWinner();
      });
    }
  }

  void checkForWinner() {
    for (int i = 0; i < 9; i += 3) {
      if (board[i] != '' &&
          board[i] == board[i + 1] &&
          board[i + 1] == board[i + 2]) {
        setState(() {
          gameEnded = true;
        });
        return;
      }
    }

    for (int i = 0; i < 3; i++) {
      if (board[i] != '' &&
          board[i] == board[i + 3] &&
          board[i + 3] == board[i + 6]) {
        setState(() {
          gameEnded = true;
        });
        return;
      }
    }

    if (board[0] != '' && board[0] == board[4] && board[4] == board[8]) {
      setState(() {
        gameEnded = true;
      });
      return;
    }

    if (board[2] != '' && board[2] == board[4] && board[4] == board[6]) {
      setState(() {
        gameEnded = true;
      });
      return;
    }

    if (!board.contains('')) {
      setState(() {
        gameEnded = true;
      });
    }
  }

  Widget buildButton(int index) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.all(4.0),
        child: ElevatedButton(
          onPressed: gameEnded ? null : () => makeMove(index),
          style: ElevatedButton.styleFrom(
              foregroundColor: Colors.black, backgroundColor: Colors.grey[200]),
          child: Text(board[index], style: const TextStyle(fontSize: 48)),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Tic Tac Toe'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(32.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              child: GridView.count(
                crossAxisCount: 3,
                children: List.generate(9, (index) => buildButton(index)),
              ),
            ),
            ElevatedButton(
              onPressed: gameEnded ? startNewGame : null,
              child: const Text('New Game'),
            ),
          ],
        ),
      ),
    );
  }
}
