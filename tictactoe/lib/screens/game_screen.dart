import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tictactoe/resources/socket_methods.dart';
import 'package:tictactoe/responsive/responsive.dart';
import 'package:tictactoe/views/waititng_lobby.dart';

import '../provider/room_data_provider.dart';
import '../views/score_board.dart';
import '../views/tictactoe_board.dart';

class GameScreen extends StatefulWidget {
  static String routeName = '/game-screen';
  const GameScreen({super.key});

  @override
  State<GameScreen> createState() => _GameScreenState();
}

class _GameScreenState extends State<GameScreen> {
  final SocketMethods _socketMethods = SocketMethods();

  @override
  void initState() {
    super.initState();
    _socketMethods.updateRoomListener(context);
    _socketMethods.updatePlayersStateListener(context);
    _socketMethods.pointIncreaseListener(context);
    _socketMethods.endGameListener(context);
  }

  @override
  Widget build(BuildContext context) {
    RoomDataProvider roomDataProvider = Provider.of<RoomDataProvider>(context);
    return Scaffold(
      extendBodyBehindAppBar: true,
      body: Responsive(
        child: roomDataProvider.roomdata['isJoin']
            ? const WaitingLobby()
            : SafeArea(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    const ScoreBoard(),
                    const TicTacToeBoard(),
                    Text(
                        '${roomDataProvider.roomdata['turn']['nickname']}\'s turn'),
                  ],
                ),
              ),
      ),
    );
  }
}
