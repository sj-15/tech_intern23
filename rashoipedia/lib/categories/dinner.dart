import 'package:flutter/material.dart';
import 'package:rashoipedia/models/recipe_model.dart';

import '../widgets/item_card.dart';

class DinnerScreen extends StatefulWidget {
  final List<Recipe> recipes;
  const DinnerScreen({super.key, required this.recipes});

  @override
  State<DinnerScreen> createState() => _DinnerScreenState();
}

class _DinnerScreenState extends State<DinnerScreen> {
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
