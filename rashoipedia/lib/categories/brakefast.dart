import 'package:flutter/material.dart';

class BrakeFastScreen extends StatefulWidget {
  final int index;
  const BrakeFastScreen({super.key, required this.index});

  @override
  State<BrakeFastScreen> createState() => _BrakeFastScreenState();
}

class _BrakeFastScreenState extends State<BrakeFastScreen> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text('${widget.index}'),
    );
  }
}
