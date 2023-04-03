import 'package:delayed_display/delayed_display.dart';
import 'package:flutter/material.dart';

class CustomButton extends StatefulWidget {
  final String text;
  final VoidCallback onPressed;
  const CustomButton({super.key, required this.text, required this.onPressed});

  @override
  State<CustomButton> createState() => _CustomButtonState();
}

class _CustomButtonState extends State<CustomButton> {
  double _buttonWidth = 300;
  double _buttonHeight = 45.0;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          _buttonWidth = 250.0;
          _buttonHeight = 40.0;
        });
        widget.onPressed();
      },
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        width: _buttonWidth,
        height: _buttonHeight,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30),
          color: const Color(0xFF1E78FE),
          boxShadow: [
            BoxShadow(
              color: const Color(0xFF1E78FE).withOpacity(0.9),
              spreadRadius: 3,
              blurRadius: 7,
            ),
          ],
        ),
        child: Center(
          child: DelayedDisplay(
            delay: const Duration(milliseconds: 2700),
            child: Text(
              widget.text,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
