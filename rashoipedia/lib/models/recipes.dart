class RecipeDetailsModel {
  final List<Map<String, dynamic>> ingredients;
  final List<String> instructions;
  final List<String> nutritions;

  RecipeDetailsModel({
    required this.ingredients,
    required this.instructions,
    required this.nutritions,
  });

  factory RecipeDetailsModel.fromMap(Map<String, dynamic> map) {
    final ingredientsData = map['ingredients'] ?? [];
    final instructionsData = map['instructions'] ?? [];
    final nutritionsData = map['nutritions'] ?? [];

    return RecipeDetailsModel(
      ingredients: List<Map<String, dynamic>>.from(ingredientsData),
      instructions: List<String>.from(instructionsData),
      nutritions: List<String>.from(nutritionsData),
    );
  }
}
