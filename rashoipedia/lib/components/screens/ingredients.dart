import 'package:flutter/material.dart';

class IngredientsList extends StatefulWidget {
  final List<Map<String, dynamic>> ingredients;
  const IngredientsList({Key? key, required this.ingredients})
      : super(key: key);

  @override
  State<IngredientsList> createState() => _IngredientsListState();
}

class _IngredientsListState extends State<IngredientsList> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        for (var ingredient in widget.ingredients)
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 4),
            child: Row(
              children: [
                const Icon(
                  Icons.circle,
                  size: 12,
                ),
                const SizedBox(
                  width: 10,
                ),
                Text(
                  ingredient['name']!,
                  style: const TextStyle(fontSize: 18),
                ),
                const Spacer(),
                Text(
                  ingredient['quantity']!,
                ),
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
