import 'package:flutter/material.dart';

import '../models/recipe_model.dart';
import '../widgets/item_card.dart';

class BrakeFastScreen extends StatefulWidget {
  final List<Recipe> recipes;
  const BrakeFastScreen({super.key, required this.recipes});

  @override
  State<BrakeFastScreen> createState() => _BrakeFastScreenState();
}

class _BrakeFastScreenState extends State<BrakeFastScreen> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: widget.recipes.length ~/ 2,
      itemBuilder: (BuildContext context, int index) {
        return Padding(
          padding: const EdgeInsets.only(top: 8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              ItemCard(
                recipe: widget.recipes[2 * index],
              ),
              ItemCard(
                recipe: widget.recipes[2 * index + 1],
              ),
            ],
          ),
        );
      },
    );
  }
}
