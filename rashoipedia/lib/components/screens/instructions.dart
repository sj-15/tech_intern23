import 'package:flutter/material.dart';
import 'package:timeline_tile/timeline_tile.dart';

class InstructionsList extends StatefulWidget {
  final List<String> instructions;
  const InstructionsList({Key? key, required this.instructions})
      : super(key: key);

  @override
  State<InstructionsList> createState() => _InstructionsListState();
}

class _InstructionsListState extends State<InstructionsList> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        for (var i = 0; i < widget.instructions.length; i++)
          TimelineTile(
            alignment: TimelineAlign.start,
            lineXY: 0.3,
            isFirst: i == 0,
            isLast: i == widget.instructions.length - 1,
            beforeLineStyle: const LineStyle(
              color: Colors.grey,
              thickness: 2,
            ),
            indicatorStyle: IndicatorStyle(
              width: 20,
              height: 20,
              indicator: DecoratedBox(
                decoration: const BoxDecoration(
                  color: Colors.blue,
                  shape: BoxShape.circle,
                ),
                child: Center(
                  child: Text(
                    (i + 1).toString(),
                    style: const TextStyle(color: Colors.white),
                  ),
                ),
              ),
            ),
            endChild: Padding(
              padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 8),
              child: Text(
                widget.instructions[i],
                style: const TextStyle(fontSize: 18),
                maxLines: 10,
                overflow: TextOverflow.ellipsis,
              ),
            ),
          )
      ],
    );
  }
}
