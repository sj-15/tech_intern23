import 'package:flutter/material.dart';

class OfflineScoreBoard extends StatelessWidget {
  final String player1name;
  final String player2name;
  const OfflineScoreBoard(
      {super.key, required this.player1name, required this.player2name});

  @override
  Widget build(BuildContext context) {
    int score1 = 0;
    int score2 = 0;
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Padding(
          padding: const EdgeInsets.all(30),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                player1name,
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                score1.toString(),
                style: const TextStyle(
                  fontSize: 20,
                ),
              )
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(30),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                player2name,
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                score2.toString(),
                style: const TextStyle(
                  fontSize: 20,
                ),
              )
            ],
          ),
        ),
      ],
    );
  }
}
