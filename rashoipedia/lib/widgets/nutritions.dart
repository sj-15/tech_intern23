import 'package:flutter/material.dart';

class Nutritions extends StatelessWidget {
  final String photoUrl;
  final String text;
  const Nutritions({super.key, required this.photoUrl, required this.text});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Card(
          elevation: 8,
          shadowColor: Colors.blue,
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(8),
            ),
          ),
          color: Colors.blueGrey.withOpacity(0.2),
          child: Center(
            child: Image.asset(
              photoUrl,
              height: 30,
              width: 30,
            ),
          ),
        ),
        const SizedBox(
          width: 10,
        ),
        Text(
          text,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }
}
