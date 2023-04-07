import 'package:flutter/material.dart';

class TextInputField extends StatelessWidget {
  final IconData icon;
  final String hintText;
  final TextInputType textInputType;
  final bool isPassword;
  final TextEditingController controller;
  const TextInputField({
    super.key,
    required this.icon,
    required this.hintText,
    required this.textInputType,
    required this.isPassword,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      style: const TextStyle(color: Colors.black),
      obscureText: isPassword,
      keyboardType: textInputType,
      controller: controller,
      decoration: InputDecoration(
        prefixIcon: IconTheme(
          data: IconThemeData(color: Colors.blue[600]),
          child: Icon(icon),
        ),
        hintText: hintText,
        hintStyle: const TextStyle(color: Colors.black),
        filled: true,
        fillColor: Colors.transparent,
        focusColor: Colors.transparent,
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 10,
          vertical: 15,
        ),
        border: InputBorder.none,
      ),
      cursorColor: Colors.black,
    );
  }
}
