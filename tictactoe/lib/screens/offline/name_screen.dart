import 'package:flutter/material.dart';
import 'package:tictactoe/responsive/responsive.dart';
import 'package:tictactoe/screens/offline/offline_game_board.dart';
import 'package:tictactoe/widgets/custom_button.dart';
import 'package:tictactoe/widgets/custom_textfield.dart';

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
            onTap: () => Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => OfflineGameBoard(
                  player1name: player1nameController.text.trim(),
                  player2name: player2nameController.text.trim(),
                ),
              ),
            ),
          ),
        ],
      )),
    );
  }
}
