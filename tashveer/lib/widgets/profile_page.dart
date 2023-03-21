import 'package:flutter/material.dart';

class BuildProfileScreen extends StatelessWidget {
  const BuildProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    const int weeksInYear = 52;
    const double squareSize = 15.0;
    const double spacing = 2.0;

    return Scaffold(
      backgroundColor: Colors.black,
      body: Column(
        children: [
          const Text(
            'Name',
            style: TextStyle(color: Colors.white),
          ),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: List.generate(
                weeksInYear,
                (weekIndex) => Column(
                  children: List.generate(
                    7,
                    (dayIndex) => Container(
                      width: squareSize,
                      height: squareSize,
                      margin: const EdgeInsets.all(spacing),
                      color: Colors.grey[300],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
