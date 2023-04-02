import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tictactoe/models/player.dart';
import 'package:tictactoe/responsive/responsive.dart';
import 'package:tictactoe/screens/offline/offline_game_board.dart';
import 'package:tictactoe/widgets/custom_button.dart';
import 'package:tictactoe/widgets/custom_textfield.dart';

import '../../provider/room_data_provider.dart';

class NameScreen extends StatefulWidget {
  static String routeName = '/name-screen';
  const NameScreen({super.key});

  @override
  State<NameScreen> createState() => _NameScreenState();
}

class _NameScreenState extends State<NameScreen> {
  TextEditingController player1nameController = TextEditingController();
  TextEditingController player2nameController = TextEditingController();
  @override
  void dispose() {
    super.dispose();
    player1nameController.dispose();
    player2nameController.dispose();
  }

  void _started() {
    RoomDataProvider roomDataProvider =
        Provider.of<RoomDataProvider>(context, listen: false);

    roomDataProvider.updatePlayer1Data({
      'nickname': player1nameController.text.trim(),
      'socketId': '',
      'points': 0,
      'playerType': 'X'
    });
    roomDataProvider.updatePlayer2Data({
      'nickname': player2nameController.text.trim(),
      'socketId': '',
      'points': 0,
      'playerType': 'O'
    });
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const OfflineGameBoard(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: Responsive(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          CustomTextField(
            hintText: 'Enter player1 name',
            controller: player1nameController,
          ),
          SizedBox(
            height: size.height * 0.03,
          ),
          CustomTextField(
            hintText: 'Enter player2 name',
            controller: player2nameController,
          ),
          SizedBox(
            height: size.height * 0.03,
          ),
          CustomButton(
            text: 'Start',
            onTap: _started,
          ),
        ],
      )),
    );
  }
}
