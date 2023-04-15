import 'dart:convert';
import 'package:http/http.dart' as http;

Future<List<dynamic>> getRecipesForCategory(int categoryId) async {
  final url = Uri.parse('http://192.168.0.120:3000/recipes/$categoryId');
  final response = await http.get(url);
  if (response.statusCode == 200) {
    final data = json.decode(response.body);
    return data;
  } else {
    throw Exception('Error fetching recipes for category');
  }
}
