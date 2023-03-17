import 'package:flutter/material.dart';

class TextInputField extends StatelessWidget {
  final String hintText;
  final TextInputType textInputType;
  final IconData icon;
  final bool isPassword;
  final TextEditingController controller;
  const TextInputField({
    super.key,
    required this.hintText,
    required this.textInputType,
    required this.icon,
    required this.isPassword,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    final inputBorder = OutlineInputBorder(
      borderSide: const BorderSide(width: 2.0, color: Colors.grey),
      borderRadius: BorderRadius.circular(15),
    );
    return TextFormField(
      decoration: InputDecoration(
        prefixIcon: IconTheme(
          data: const IconThemeData(
            color: Colors.grey,
          ),
          child: Icon(icon),
        ),
        hintText: hintText,
        hintStyle: const TextStyle(color: Colors.grey),
        contentPadding:
            const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
        enabledBorder: inputBorder,
        focusedBorder: inputBorder,
        filled: true,
        fillColor: Colors.transparent,
        focusColor: Colors.transparent,
      ),
      cursorColor: Colors.black,
      style: const TextStyle(color: Colors.black),
      obscureText: isPassword,
      keyboardType: textInputType,
      controller: controller,
    );
  }
}
