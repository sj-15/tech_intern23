import 'package:delayed_display/delayed_display.dart';
import 'package:flutter/material.dart';

class CustomButton extends StatefulWidget {
  final String text;
  final VoidCallback onPressed;
  const CustomButton({Key? key, required this.text, required this.onPressed})
      : super(key: key);

  @override
  State<CustomButton> createState() => _CustomButtonState();
}

class _CustomButtonState extends State<CustomButton> {
  double _buttonWidth = 300;
  double _buttonHeight = 45.0;

  void _onTapDown() {
    setState(() {
      _buttonWidth = 200.0;
      _buttonHeight = 35.0;
    });
  }

  void _onTapUp() {
    setState(() {
      _buttonWidth = 300;
      _buttonHeight = 45.0;
    });
    widget.onPressed();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTapDown: (_) => _onTapDown(),
      onTapUp: (_) => _onTapUp(),
      onTapCancel: () {
        setState(() {
          _buttonWidth = 300;
          _buttonHeight = 45.0;
        });
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
            delay: const Duration(milliseconds: 2000),
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
