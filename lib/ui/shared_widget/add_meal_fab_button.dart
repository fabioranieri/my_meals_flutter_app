import 'package:flutter/material.dart';
import 'package:my_meals_flutter_app/model/meal.dart';
import 'package:my_meals_flutter_app/ui/meal_details'
    '/meal_details_screen.dart';

class AddMealFabButton extends StatelessWidget {

  const AddMealFabButton();

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => MealDetailsScreen(
              meal: Meal())
          ),
        );
      },
      child: Icon(Icons.add),
      backgroundColor: Theme.of(context).primaryColor,
      elevation: 7,
    );
  }
}