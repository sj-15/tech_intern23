import 'package:flutter/material.dart';
import 'package:tictactoe/utils/colors.dart';

class CustomTextField extends StatelessWidget {
  final String hintText;
  final TextEditingController controller;
  final bool isReadOnly;
  const CustomTextField({
    super.key,
    required this.hintText,
    required this.controller,
    this.isReadOnly = false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(boxShadow: [
        BoxShadow(
          color: Colors.blue,
          blurRadius: 5,
          spreadRadius: 2,
        )
      ]),
      child: TextField(
        controller: controller,
        decoration: InputDecoration(
            hintText: hintText, fillColor: dbgColor, filled: true),
      ),
    );
  }
}
