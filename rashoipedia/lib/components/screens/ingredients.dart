import 'package:flutter/material.dart';
import 'package:rashoipedia/models/recipes.dart';

class IngredientsList extends StatefulWidget {
  const IngredientsList({Key? key}) : super(key: key);

  @override
  State<IngredientsList> createState() => _IngredientsListState();
}

class _IngredientsListState extends State<IngredientsList> {
  RecipeModel recipeModel = RecipeModel();
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        for (var ingredient in recipeModel.ingredients)
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 4),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  ingredient['name']!,
                  style: TextStyle(fontSize: 24),
                ),
                Text(ingredient['quantity']!),
              ],
            ),
          ),
        const SizedBox(
          height: 8,
        ),
      ],
    );
  }
}
