import 'package:flutter/material.dart';

class BuildProfileScreen extends StatefulWidget {
  const BuildProfileScreen({super.key});

  @override
  State<BuildProfileScreen> createState() => _BuildProfileScreenState();
}

class _BuildProfileScreenState extends State<BuildProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: const [
          Text(
            'name',
            style: TextStyle(color: Colors.white),
          ),
        ],
      ),
    );
  }
}
