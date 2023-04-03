import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tictactoe/provider/room_data_provider.dart';
import 'package:tictactoe/screens/online/create_room.dart';
import 'package:tictactoe/screens/online/game_screen.dart';
import 'package:tictactoe/screens/online/join_room.dart';
import 'package:tictactoe/screens/main_menu_screen.dart';
import 'package:tictactoe/screens/offline/name_screen.dart';
import 'package:tictactoe/screens/with_ai.dart';
import 'package:tictactoe/utils/colors.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => RoomDataProvider(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'tic-tac-toe',
        theme: ThemeData.dark().copyWith(
          scaffoldBackgroundColor: dbgColor,
        ),
        routes: {
          MainMenuScreen.routeName: (context) => const MainMenuScreen(),
          CreateRoomScreen.routeName: (context) => const CreateRoomScreen(),
          JoinRoomScreen.routeName: (context) => const JoinRoomScreen(),
          GameScreen.routeName: (context) => const GameScreen(),
          PlayWithAI.routeName: (context) => const PlayWithAI(),
          NameScreen.routeName: (context) => const NameScreen(),
        },
        initialRoute: MainMenuScreen.routeName,
      ),
    );
  }
}
