import 'package:flutter/material.dart';
import 'package:rashoipedia/components/colors/color.dart';
import 'package:rashoipedia/components/screens/ingredients.dart';
import 'package:rashoipedia/components/screens/instructions.dart';
import 'package:rashoipedia/models/recipe_model.dart';
import 'package:rashoipedia/models/recipes.dart';
import 'package:rashoipedia/services/mysql_client.dart';
import 'package:rashoipedia/widgets/custom_card.dart';
import 'package:rashoipedia/widgets/nutritions.dart';
import 'package:sliding_sheet/sliding_sheet.dart';

class RecipeDetails extends StatefulWidget {
  final Recipe recipe;
  const RecipeDetails({Key? key, required this.recipe}) : super(key: key);

  @override
  State<RecipeDetails> createState() => _RecipeDetailsState();
}

class _RecipeDetailsState extends State<RecipeDetails> {
  bool isIngredients = true;
  RecipeDetailsModel? recipeDetailsModel;
  @override
  void initState() {
    super.initState();
    fetchRecipeDetails(widget.recipe.id).then((details) {
      setState(() {
        recipeDetailsModel = details;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    if (recipeDetailsModel == null) {
      return const Center(child: CircularProgressIndicator());
    }
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
                Image.network(
                  widget.recipe.photoUrl,
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
                          children: [
                            const Icon(Icons.star, color: Colors.yellow),
                            Text(widget.recipe.rating),
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
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          widget.recipe.name,
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: size.width * 0.07,
                            fontWeight: FontWeight.bold,
                          ),
                          maxLines: 3,
                          overflow: TextOverflow.ellipsis,
                        ),
                        Row(
                          children: [
                            const Icon(
                              Icons.access_time,
                              color: Colors.white38,
                              size: 15,
                            ),
                            const SizedBox(
                              width: 5,
                            ),
                            Text(
                              '${widget.recipe.time.toString()} m',
                              style: const TextStyle(
                                color: Colors.white60,
                                fontSize: 15,
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Text(
                      widget.recipe.shortDes,
                      style: const TextStyle(
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
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Nutritions(
                              photoUrl: 'assets/carbo.jpg',
                              text:
                                  '${recipeDetailsModel!.nutritions[0]} carbos',
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Nutritions(
                              photoUrl: 'assets/energy.png',
                              text: '${recipeDetailsModel!.nutritions[2]} kcal',
                            ),
                          ],
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Nutritions(
                              photoUrl: 'assets/protein.png',
                              text:
                                  '${recipeDetailsModel!.nutritions[1]}g protein',
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Nutritions(
                              photoUrl: 'assets/fat.png',
                              text:
                                  "${recipeDetailsModel!.nutritions[recipeDetailsModel!.nutritions.length - 1]}g fat",
                            ),
                          ],
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [
                        SizedBox(
                          width: 30,
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
                        ? IngredientsList(
                            ingredients: recipeDetailsModel!.ingredients)
                        : InstructionsList(
                            instructions: recipeDetailsModel!.instructions),
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
