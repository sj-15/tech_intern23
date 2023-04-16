import '../screens/recipe_details.dart';

class RecipeModel {
  List<Map<String, String>> ingredients = [
    {'name': 'Chicken', 'quantity': '1 lb'},
    {'name': 'Butter', 'quantity': '2 tbsp'},
    {'name': 'Onion', 'quantity': '1'},
    {'name': 'Tomato', 'quantity': '2'},
    {'name': 'Garlic', 'quantity': '4 cloves'},
    {'name': 'Ginger', 'quantity': '1 inch'},
    {'name': 'Heavy cream', 'quantity': '1 cup'},
    {'name': 'Garam masala', 'quantity': '1 tsp'},
    {'name': 'Cumin powder', 'quantity': '1 tsp'},
    {'name': 'Coriander powder', 'quantity': '1 tsp'},
    {'name': 'Red chili powder', 'quantity': '1 tsp'},
    {'name': 'Salt', 'quantity': 'to taste'},
  ];

  List<String> instructions = [
    'Heat butter in a pan and saute onions until translucent.',
    'Add chopped garlic and ginger and saute for a minute.',
    'Add chopped tomatoes and cook until they turn mushy.',
    'Add spices and cook for a minute.',
    'Add chicken and cook until it turns white.',
    'Add water and let it simmer for 15-20 minutes.',
    'Add heavy cream and cook for a few more minutes.',
    'Garnish with chopped coriander leaves and serve hot.'
  ];
}

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
