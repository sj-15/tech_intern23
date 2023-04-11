import 'package:flutter/material.dart';
import 'package:rashoipedia/components/colors/color.dart';
import 'package:rashoipedia/components/screens/ingredients.dart';
import 'package:rashoipedia/components/screens/instructions.dart';
import 'package:rashoipedia/widgets/custom_card.dart';
import 'package:rashoipedia/widgets/nutritions.dart';
import 'package:sliding_sheet/sliding_sheet.dart';

class RecipeDetails extends StatefulWidget {
  const RecipeDetails({Key? key}) : super(key: key);

  @override
  State<RecipeDetails> createState() => _RecipeDetailsState();
}

class _RecipeDetailsState extends State<RecipeDetails> {
  bool isIngredients = true;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      extendBodyBehindAppBar: true,
      body: LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
          return SlidingSheet(
            elevation: 10,
            cornerRadius: 30,
            color: background,
            snapSpec: const SnapSpec(
              snap: true,
              snappings: [0.65, 0.65, 0.85],
              positioning: SnapPositioning.relativeToAvailableSpace,
            ),
            body: Stack(
              children: [
                Image.asset(
                  'assets/meal5.jpg',
                  height: size.height * 0.4,
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 30, horizontal: 8),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      InkWell(
                        onTap: () => Navigator.pop(context),
                        child: Container(
                          height: 40,
                          width: 40,
                          decoration: const BoxDecoration(
                            color: background,
                            borderRadius: BorderRadius.all(
                              Radius.circular(8),
                            ),
                          ),
                          child: const Icon(Icons.close),
                        ),
                      ),
                      Container(
                        height: 25,
                        width: 50,
                        decoration: const BoxDecoration(
                          color: background,
                          borderRadius: BorderRadius.all(
                            Radius.circular(8),
                          ),
                        ),
                        child: Row(
                          children: const [
                            Icon(Icons.star, color: Colors.yellow),
                            Text('4.5'),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            builder: (context, state) {
              return Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 24.0, vertical: 12),
                child: Column(
                  children: [
                    Container(
                      decoration: const BoxDecoration(
                        borderRadius: BorderRadius.all(
                          Radius.circular(18),
                        ),
                        color: Colors.white38,
                      ),
                      height: 6,
                      width: size.width * 0.15,
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Row(
                      children: const [
                        Text(
                          'Butter Chicken',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 30,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(
                          width: 60,
                        ),
                        Icon(
                          Icons.access_time,
                          color: Colors.white38,
                          size: 15,
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        Text(
                          '50 Mins',
                          style: TextStyle(
                            color: Colors.white60,
                            fontSize: 15,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    const Text(
                      'Juicy chicken pieces in a rich, creamy tomato-based gravy.',
                      style: TextStyle(
                        color: Colors.white54,
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: const [
                        Nutritions(
                          photoUrl: 'assets/carbo.jpg',
                          text: '13.6g carbs',
                        ),
                        Nutritions(
                          photoUrl: 'assets/protein.png',
                          text: '33.2g proteins',
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [
                        Nutritions(
                          photoUrl: 'assets/energy.png',
                          text: '427 Kcal',
                        ),
                        SizedBox(
                          width: 30,
                        ),
                        Nutritions(
                          photoUrl: 'assets/fat.png',
                          text: '26.8g fats',
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    CustomCard(
                      isIngredients: isIngredients,
                      onSelect: (value) {
                        setState(() {
                          isIngredients =
                              value; // Update the value of isIngredients
                        });
                      },
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    isIngredients
                        ? const IngredientsList()
                        : const InstructionsList(),
                  ],
                ),
              );
            },
          );
        },
      ),
    );
  }
}
