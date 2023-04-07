import 'package:flutter/material.dart';

class DinnerScreen extends StatefulWidget {
  const DinnerScreen({super.key});

  @override
  State<DinnerScreen> createState() => _DinnerScreenState();
}

class _DinnerScreenState extends State<DinnerScreen> {
  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text('Dinner'),
    );
  }
}
