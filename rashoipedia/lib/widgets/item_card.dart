import 'package:flutter/material.dart';
import 'package:rashoipedia/screens/recipe_details.dart';

class ItemCard extends StatelessWidget {
  final int index;
  const ItemCard({super.key, required this.index});

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
              builder: (context) => const RecipeDetails(),
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
                        const Text(
                          'Butter chicken',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                          ),
                          textAlign: TextAlign.center,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: const [
                            Icon(
                              Icons.star,
                              color: Colors.yellow,
                              size: 15,
                            ),
                            Text(
                              '4.9',
                              style: TextStyle(
                                fontSize: 15,
                              ),
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Icon(
                              Icons.access_time,
                              color: Colors.blue,
                              size: 15,
                            ),
                            Text(
                              '60 m',
                              style: TextStyle(
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
            const Positioned(
              left: 25,
              child: CircleAvatar(
                radius: 50,
                backgroundImage: AssetImage('assets/meal3.jpg'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
