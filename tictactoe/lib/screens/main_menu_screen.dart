import 'package:flutter/material.dart';
import 'package:tictactoe/responsive/responsive.dart';
import 'package:tictactoe/screens/online/create_room.dart';
import 'package:tictactoe/screens/offline/name_screen.dart';
import 'package:tictactoe/screens/with_ai.dart';
import 'package:tictactoe/widgets/custom_button.dart';

import 'online/join_room.dart';

class MainMenuScreen extends StatelessWidget {
  static String routeName = '/main-menu';
  const MainMenuScreen({Key? key}) : super(key: key);

  void createroom(BuildContext context) {
    Navigator.pushNamed(context, CreateRoomScreen.routeName);
  }

  void joinroom(BuildContext context) {
    Navigator.pushNamed(context, JoinRoomScreen.routeName);
  }

  void playwithai(BuildContext context) {
    Navigator.pushNamed(context, PlayWithAI.routeName);
  }

  void namescreen(BuildContext context) {
    Navigator.pushNamed(context, NameScreen.routeName);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Responsive(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'assets/tictactoe.jpg',
              height: 200,
              width: 200,
            ),
            const SizedBox(
              height: 20,
            ),
            CustomButton(text: 'Create room', onTap: () => createroom(context)),
            const SizedBox(
              height: 10,
            ),
            CustomButton(text: 'Join room', onTap: () => joinroom(context)),
            const SizedBox(
              height: 10,
            ),
            CustomButton(
                text: 'Play with AI', onTap: () => playwithai(context)),
            const SizedBox(
              height: 10,
            ),
            CustomButton(
                text: 'Play with friend', onTap: () => namescreen(context)),
          ],
        ),
      ),
    );
  }
}
