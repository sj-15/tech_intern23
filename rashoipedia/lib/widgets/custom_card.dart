import 'package:flutter/material.dart';

class CustomCard extends StatefulWidget {
  final bool isIngredients;
  final Function(bool) onSelect;
  const CustomCard({
    Key? key,
    required this.isIngredients,
    required this.onSelect,
  }) : super(key: key);

  @override
  State<CustomCard> createState() => _CustomCardState();
}

class _CustomCardState extends State<CustomCard> {
  String _selectedOption = 'Ingredients';

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15.0),
      ),
      color: Colors.blueGrey.withOpacity(0.2),
      elevation: 2.0,
      child: Row(
        children: [
          Expanded(
            child: Container(
              padding: const EdgeInsets.all(5),
              child: InkWell(
                onTap: () {
                  setState(() {
                    _selectedOption = 'Ingredients';
                    if (!widget.isIngredients) {
                      widget.onSelect(
                          true); // Call the onSelect function with the value false
                    }
                  });
                },
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: const BorderRadius.all(Radius.circular(15)),
                    color: _selectedOption == 'Ingredients'
                        ? Colors.blueGrey
                        : Colors.transparent,
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Text(
                      'Ingredients',
                      style: TextStyle(
                        color: _selectedOption == 'Ingredients'
                            ? Colors.black
                            : Colors.white,
                        fontSize: 18.0,
                        fontWeight: FontWeight.bold,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
              ),
            ),
          ),
          Expanded(
            child: Container(
              padding: const EdgeInsets.all(5),
              child: InkWell(
                onTap: () {
                  setState(() {
                    _selectedOption = 'Instructions';
                    if (widget.isIngredients) {
                      widget.onSelect(
                          false); // Call the onSelect function with the value false
                    }
                  });
                },
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: const BorderRadius.all(Radius.circular(15)),
                    color: _selectedOption == 'Instructions'
                        ? Colors.blueGrey
                        : Colors.transparent,
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Text(
                      'Instructions',
                      style: TextStyle(
                        color: _selectedOption == 'Instructions'
                            ? Colors.black
                            : Colors.white,
                        fontSize: 18.0,
                        fontWeight: FontWeight.bold,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
