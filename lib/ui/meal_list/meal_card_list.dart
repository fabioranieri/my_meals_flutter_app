import 'package:flutter/material.dart';
import 'package:my_meals_flutter_app/model/meal.dart';

import 'meal_card_item.dart';

class MealCardListItem extends StatelessWidget {
  const MealCardListItem({this.items, this.mealDetails});
  final List<Meal> items;
  final Function mealDetails;

  @override
  Widget build(BuildContext context) {
    return items.length > 0 ?
    Container(
      child: ListView.builder(
        scrollDirection: Axis.vertical,
        shrinkWrap: true,
        itemCount: items.length,
        itemBuilder: (context, index) {
          return Card(
            elevation: 3.0,
            margin: const EdgeInsets.symmetric(horizontal: 7.0, vertical: 4.0),
            child: Container(
              decoration: BoxDecoration(color: Colors.lightBlueAccent[300]),
              child: ListItem(
                item: items[index],
                index: index,
                mealDetails: mealDetails,
              ),
            ),
          );
        },
      ),
    ) : Center(child: const Text('No items found, please add some.'));
  }
}