import 'package:flutter/material.dart';

class SnackScreen extends StatefulWidget {
  const SnackScreen({super.key});

  @override
  State<SnackScreen> createState() => _SnackScreenState();
}

class _SnackScreenState extends State<SnackScreen> {
  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text('Snacks'),
    );
  }
}
