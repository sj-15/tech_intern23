import 'package:flutter/material.dart';

class CircleIcon extends StatelessWidget {
  final String imagePath;
  final Function()? onTap;
  const CircleIcon({super.key, required this.imagePath, this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          border: Border.all(color: Colors.white),
          borderRadius: BorderRadius.circular(200),
          color: Colors.grey[200],
        ),
        child: Image.asset(
          imagePath,
          height: 40,
          color: Colors.black,
        ),
      ),
    );
  }
}
