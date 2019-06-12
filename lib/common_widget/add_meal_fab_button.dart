import 'package:flutter/material.dart';
import 'package:my_meals_flutter_app/model/meal.dart';
import 'package:my_meals_flutter_app/screen/meal_details_screen/meal_details_screen.dart';

class AddMealFabButton extends StatelessWidget {

  AddMealFabButton();

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => MealDetailsScreen(meal: Meal(
              null,
              null,
              null,
              null,
              null,
              null,
              null,
              null
          )
          )),
        );
      },
      child: Icon(Icons.add),
      backgroundColor: Theme.of(context).primaryColor,
      elevation: 7,
    );
  }
}