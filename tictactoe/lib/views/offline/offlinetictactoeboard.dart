import 'package:flutter/material.dart';
import 'package:tictactoe/resources/offline/offline_game_methods.dart';

class OfflineTicTacToeBoard extends StatefulWidget {
  const OfflineTicTacToeBoard({super.key});

  @override
  State<OfflineTicTacToeBoard> createState() => _OfflineTicTacToeBoardState();
}

class _OfflineTicTacToeBoardState extends State<OfflineTicTacToeBoard> {
  final OfflineGameMethods _offlineGameMethods = OfflineGameMethods();

  late String currentPlayer = 'X';

  void tapped(int index) {
    if (_offlineGameMethods.boardElements[index] == '') {
      _offlineGameMethods.boardElements[index] = currentPlayer;
      setState(() {
        _offlineGameMethods.filledBoxes += 1;
        _offlineGameMethods.checkWinner(context, currentPlayer);
        currentPlayer == 'X' ? currentPlayer = 'O' : currentPlayer = 'X';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return ConstrainedBox(
      constraints: BoxConstraints(
        maxHeight: size.height * 0.7,
        maxWidth: 400,
      ),
      child: GridView.builder(
        itemCount: 9,
        gridDelegate:
            const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3),
        itemBuilder: (BuildContext context, int index) {
          return GestureDetector(
            onTap: () => tapped(index),
            child: Container(
              decoration: BoxDecoration(
                border: Border.all(color: Colors.white24),
              ),
              child: Center(
                child: AnimatedSize(
                  duration: const Duration(milliseconds: 200),
                  child: Text(
                    _offlineGameMethods.boardElements[index],
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 100,
                      fontWeight: FontWeight.bold,
                      shadows: [
                        Shadow(
                          blurRadius: 40,
                          color: _offlineGameMethods.boardElements[index] == 'O'
                              ? Colors.red
                              : Colors.blue,
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
