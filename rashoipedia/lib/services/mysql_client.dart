import 'dart:convert';
import 'package:http/http.dart' as http;

import '../models/recipes.dart';

Future<List<dynamic>> getRecipesForCategory(int categoryId) async {
  final url = Uri.parse('http://YourIPaddress:3000/recipes/$categoryId');
  final response = await http.get(url);
  if (response.statusCode == 200) {
    final data = json.decode(response.body);
    return data;
  } else {
    throw Exception('Error fetching recipes for category');
  }
}

Future<RecipeDetailsModel> fetchRecipeDetails(int recipeId) async {
  final response =
      await http.get(Uri.parse('http://YourIPaddress:3000/recipe/$recipeId'));
  if (response.statusCode == 200) {
    final data = jsonDecode(response.body) as Map<String, dynamic>;
    return RecipeDetailsModel.fromMap(data);
  } else {
    throw Exception('Failed to load recipe details');
  }
}
