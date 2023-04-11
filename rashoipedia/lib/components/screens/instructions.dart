import 'package:flutter/material.dart';
import 'package:timeline_tile/timeline_tile.dart';
import '../../models/recipes.dart';

class InstructionsList extends StatefulWidget {
  const InstructionsList({Key? key}) : super(key: key);

  @override
  State<InstructionsList> createState() => _InstructionsListState();
}

class _InstructionsListState extends State<InstructionsList> {
  RecipeModel recipeModel = RecipeModel();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        for (var i = 0; i < recipeModel.instructions.length; i++)
          TimelineTile(
            alignment: TimelineAlign.start,
            lineXY: 0.3,
            isFirst: i == 0,
            isLast: i == recipeModel.instructions.length - 1,
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
                recipeModel.instructions[i],
                style: const TextStyle(fontSize: 18),
                maxLines: 3,
                overflow: TextOverflow.ellipsis,
              ),
            ),
          )
      ],
    );
  }
}
