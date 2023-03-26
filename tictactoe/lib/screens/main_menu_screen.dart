import 'package:flutter/material.dart';
import 'package:tictactoe/responsive/responsive.dart';
import 'package:tictactoe/screens/create_room.dart';
import 'package:tictactoe/widgets/custom_button.dart';

import 'join_room.dart';

class MainMenuScreen extends StatelessWidget {
  static String routeName = '/main-menu';
  const MainMenuScreen({Key? key}) : super(key: key);

  void createroom(BuildContext context) {
    Navigator.pushNamed(context, CreateRoomScreen.routeName);
  }

  void joinroom(BuildContext context) {
    Navigator.pushNamed(context, JoinRoomScreen.routeName);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Responsive(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CustomButton(text: 'Create room', onTap: () => createroom(context)),
            const SizedBox(
              height: 10,
            ),
            CustomButton(text: 'Join room', onTap: () => joinroom(context)),
            const SizedBox(
              height: 10,
            ),
            CustomButton(text: 'Play with AI', onTap: () {}),
            const SizedBox(
              height: 10,
            ),
            CustomButton(text: 'Play with friend', onTap: () {}),
          ],
        ),
      ),
    );
  }
}
