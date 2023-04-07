import 'package:flutter/material.dart';

class DesertsScreen extends StatefulWidget {
  const DesertsScreen({super.key});

  @override
  State<DesertsScreen> createState() => _DesertsScreenState();
}

class _DesertsScreenState extends State<DesertsScreen> {
  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text('Deserts'),
    );
  }
}
