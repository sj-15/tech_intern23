import 'package:flutter/material.dart';
import 'package:rashoipedia/models/recipe_model.dart';
import 'package:rashoipedia/screens/recipe_details.dart';

class ItemCard extends StatelessWidget {
  final Recipe recipe;

  const ItemCard({
    super.key,
    required this.recipe,
  });

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return SizedBox(
      width: size.width * 0.4,
      height: size.height * 0.21,
      child: GestureDetector(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => RecipeDetails(recipe: recipe),
            ),
          );
        },
        child: Stack(
          children: [
            Positioned(
              top: 50,
              left: 0,
              right: 0,
              child: Container(
                height: size.height * 0.15,
                width: size.width * 0.4,
                decoration: BoxDecoration(
                  color: Colors.blueGrey.withOpacity(0.2),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Center(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        SizedBox(
                          height: size.height * 0.05,
                        ),
                        Text(
                          recipe.name,
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                          ),
                          textAlign: TextAlign.center,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            const Icon(
                              Icons.star,
                              color: Colors.yellow,
                              size: 15,
                            ),
                            Text(
                              recipe.rating.toString(),
                              style: const TextStyle(
                                fontSize: 15,
                              ),
                            ),
                            const SizedBox(
                              width: 20,
                            ),
                            const Icon(
                              Icons.access_time,
                              color: Colors.blue,
                              size: 15,
                            ),
                            Text(
                              '${recipe.time} m',
                              style: const TextStyle(
                                fontSize: 15,
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ),
            Positioned(
              left: 25,
              child: CircleAvatar(
                radius: 50,
                backgroundImage: NetworkImage(recipe.photoUrl),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
