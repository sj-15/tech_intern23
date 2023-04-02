import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tictactoe/resources/offline/offline_game_methods.dart';

import '../../provider/room_data_provider.dart';

class OfflineTicTacToeBoard extends StatefulWidget {
  const OfflineTicTacToeBoard({super.key});

  @override
  State<OfflineTicTacToeBoard> createState() => _OfflineTicTacToeBoardState();
}

class _OfflineTicTacToeBoardState extends State<OfflineTicTacToeBoard> {
  final OfflineGameMethods _offlineGameMethods = OfflineGameMethods();

  late String currentPlayer = 'X';

  void tapped(int index, RoomDataProvider roomDataProvider) {
    if (roomDataProvider.displayElements[index] == '') {
      roomDataProvider.updateDisplayElements(index, currentPlayer);
      setState(() {
        _offlineGameMethods.checkWinner(context, currentPlayer);
        currentPlayer == 'X' ? currentPlayer = 'O' : currentPlayer = 'X';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    RoomDataProvider roomDataProvider = Provider.of<RoomDataProvider>(context);
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
            onTap: () => tapped(
              index,
              roomDataProvider,
            ),
            child: Container(
              decoration: BoxDecoration(
                border: Border.all(
                  color: Colors.white24,
                ),
              ),
              child: Center(
                child: AnimatedSize(
                  duration: const Duration(milliseconds: 200),
                  child: Text(
                    roomDataProvider.displayElements[index],
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 100,
                      fontWeight: FontWeight.bold,
                      shadows: [
                        Shadow(
                          blurRadius: 40,
                          color: roomDataProvider.displayElements[index] == 'O'
                              ? Colors.red
                              : Colors.blue,
                        ),
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
