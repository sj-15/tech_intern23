import 'package:flutter/material.dart';
import 'package:tictactoe/resources/offline/offline_game_methods.dart';
import 'package:tictactoe/responsive/responsive.dart';
import 'package:tictactoe/views/offline/score_board.dart';

import '../../views/offline/offlinetictactoeboard.dart';

class OfflineGameBoard extends StatefulWidget {
  final String player1name;
  final String player2name;
  const OfflineGameBoard(
      {super.key, required this.player1name, required this.player2name});

  @override
  State<OfflineGameBoard> createState() => _OfflineGameBoardState();
}

class _OfflineGameBoardState extends State<OfflineGameBoard> {
  int score1 = OfflineGameMethods().score1;
  int score2 = OfflineGameMethods().score2;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Responsive(
        child: SafeArea(
          child: Column(
            children: [
              OfflineScoreBoard(
                player1name: widget.player1name,
                player2name: widget.player2name,
              ),
              const OfflineTicTacToeBoard(),
            ],
          ),
        ),
      ),
    );
  }
}
