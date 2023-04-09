import 'package:flutter/material.dart';

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
    return Container(
      height: MediaQuery.of(context).size.height * 0.4,
      child: ListView.builder(
        itemCount: recipeModel.instructions.length,
        itemBuilder: (BuildContext context, int index) {
          return ListTile(
            leading: const Icon(Icons.arrow_forward),
            title: Text(recipeModel.instructions[index]),
          );
        },
      ),
    );
  }
}
