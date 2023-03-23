import 'package:flutter/material.dart';
import 'package:tictactoe/tictactoe.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'tic-tac-toe',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Container(
        child: const TicTacToeGame(),
      ),
    );
  }
}
