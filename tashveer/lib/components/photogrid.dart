import 'package:flutter/material.dart';

class PhotoGrid extends StatefulWidget {
  const PhotoGrid({super.key});

  @override
  State createState() => _PhotoGridState();
}

class _PhotoGridState extends State<PhotoGrid> {
  final List<List<bool>> _photoEvents =
      List.generate(12, (_) => List.filled(7, false));

  void _updatePhotoEvent(int month, int day, bool uploaded) {
    setState(() {
      _photoEvents[month][day] = uploaded;
    });
  }

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      itemCount: 7 * 12,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 12,
        childAspectRatio: 1,
      ),
      itemBuilder: (context, index) {
        final day = index % 7;
        final month = index ~/ 7;
        final hasPhoto = _photoEvents[month][day];
        final color = hasPhoto ? Colors.green : Colors.white;
        return Container(
          color: color,
          margin: const EdgeInsets.all(2),
          child: GestureDetector(
            onTap: () {
              _updatePhotoEvent(month, day, !hasPhoto);
            },
            child: Text('Day ${day + 1}\nMonth ${month + 1}'),
          ),
        );
      },
    );
  }
}
