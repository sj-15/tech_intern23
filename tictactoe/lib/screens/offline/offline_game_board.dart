import 'package:flutter/material.dart';
import 'package:tictactoe/responsive/responsive.dart';
import 'package:tictactoe/views/offline/score_board.dart';
import 'package:tictactoe/widgets/custom_button.dart';

import '../../views/offline/offlinetictactoeboard.dart';

class OfflineGameBoard extends StatefulWidget {
  const OfflineGameBoard({super.key});

  @override
  State<OfflineGameBoard> createState() => _OfflineGameBoardState();
}

class _OfflineGameBoardState extends State<OfflineGameBoard> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Responsive(
        child: SafeArea(
          child: Column(
            children: [
              const OfflineScoreBoard(),
              const OfflineTicTacToeBoard(),
              CustomButton(
                text: 'Exit game',
                onTap: () => Navigator.pop(context),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
