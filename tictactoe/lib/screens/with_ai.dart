import 'dart:math';

import 'package:flutter/material.dart';
import 'package:tictactoe/responsive/responsive.dart';

class PlayWithAI extends StatefulWidget {
  static String routeName = '/playwithai';
  const PlayWithAI({Key? key}) : super(key: key);

  @override
  _PlayWithAIState createState() => _PlayWithAIState();
}

class _PlayWithAIState extends State<PlayWithAI> {
  late List<List<String>> board;
  late String player;
  late String aiPlayer;
  bool gameOver = false;
  late String winner;

  @override
  void initState() {
    super.initState();
    initializeBoard();
  }

  void initializeBoard() {
    board = List.generate(3, (_) => List.generate(3, (_) => ''));
    player = 'X';
    aiPlayer = 'O';
    gameOver = false;
    winner = '';
  }

  void playMove(int row, int col) {
    if (board[row][col] == '') {
      setState(() {
        board[row][col] = player;
        checkWinner();
        if (!gameOver) {
          player = player == 'X' ? 'O' : 'X';
          playAIMove();
        }
      });
    }
  }

  void playAIMove() {
    if (!gameOver) {
      // Find a random empty cell to play
      List<int> emptyCells = [];
      for (int i = 0; i < 3; i++) {
        for (int j = 0; j < 3; j++) {
          if (board[i][j] == '') {
            emptyCells.add(i * 3 + j);
          }
        }
      }
      if (emptyCells.isNotEmpty) {
        int randomIndex = Random().nextInt(emptyCells.length);
        int row = emptyCells[randomIndex] ~/ 3;
        int col = emptyCells[randomIndex] % 3;
        setState(() {
          board[row][col] = aiPlayer;
          checkWinner();
          if (!gameOver) {
            player = player == 'X' ? 'O' : 'X';
          }
        });
      }
    }
  }

  void checkWinner() {
    // Check rows
    for (int i = 0; i < 3; i++) {
      if (board[i][0] != '' &&
          board[i][0] == board[i][1] &&
          board[i][1] == board[i][2]) {
        gameOver = true;
        winner = board[i][0];
        return;
      }
    }
    // Check columns
    for (int j = 0; j < 3; j++) {
      if (board[0][j] != '' &&
          board[0][j] == board[1][j] &&
          board[1][j] == board[2][j]) {
        gameOver = true;
        winner = board[0][j];
        return;
      }
    }
    // Check diagonals
    if (board[0][0] != '' &&
        board[0][0] == board[1][1] &&
        board[1][1] == board[2][2]) {
      gameOver = true;
      winner = board[0][0];
      return;
    }
    if (board[0][2] != '' &&
        board[0][2] == board[1][1] &&
        board[1][1] == board[2][0]) {
      gameOver = true;
      winner = board[0][2];
      return;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Responsive(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            GridView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: 9,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                mainAxisSpacing: 4.0,
                crossAxisSpacing: 4.0,
              ),
              itemBuilder: (BuildContext context, int index) {
                int row = index ~/ 3;
                int col = index % 3;
                return GestureDetector(
                  onTap: () => playMove(row, col),
                  child: Container(
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.black),
                    ),
                    child: Center(
                      child: Text(
                        board[row][col],
                        style: const TextStyle(fontSize: 50),
                      ),
                    ),
                  ),
                );
              },
            ),
            const SizedBox(height: 30),
            Text(
              gameOver ? 'Winner: $winner' : "Player's turn: $player",
              style: Theme.of(context).textTheme.titleLarge,
            ),
            const SizedBox(height: 30),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  initializeBoard();
                });
              },
              child: const Text('Restart'),
            ),
          ],
        ),
      ),
    );
  }
}
