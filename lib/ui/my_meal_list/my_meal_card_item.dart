import 'package:flutter/material.dart';
import 'package:my_meals_flutter_app/model/meal.dart';
import 'package:my_meals_flutter_app/ui/meal_details/meal_photo.dart';

class MyMealCardItem extends StatelessWidget {
  const MyMealCardItem(this.item, this.index);
  final Meal item;
  final int index;

  @override
  Widget build(BuildContext context) {
    return Column(
        children: [
          MealPhoto(item),
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(item.name == null ? '' : item.name),
                const SizedBox(height: 10.0),
                Row(
                  children: [
                    Icon(Icons.bookmark, size: 20.0),
                    const SizedBox(width: 5.0),
                    Text(item.type == null ? '' : item.type),
                  ],
                ),
                Row(
                  children: [
                    Icon(Icons.description, size: 20.0),
                    const SizedBox(width: 5.0),
                    Text(item.description == null ? '' : item.description),
                  ],
                ),
              ],
            ),
          )
        ]
    );
  }
}