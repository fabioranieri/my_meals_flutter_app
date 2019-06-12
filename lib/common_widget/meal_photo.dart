import 'package:flutter/material.dart';
import 'package:my_meals_flutter_app/model/meal.dart';

class MealPhoto extends StatelessWidget {
  final Meal item;

  const MealPhoto(this.item);

  @override
  Widget build(BuildContext context) {
    if(item.photoIsEmpty()) {
      return AspectRatio(
        aspectRatio: 16.0 / 9.0,
        child: Image.asset('app_assets/no-photo-available.png',
          fit: BoxFit.cover,
        ),
      );
    } else {
      return AspectRatio(
        aspectRatio: 16.0 / 9.0,
        child: Image.memory(item.decodePhoto(), fit: BoxFit.fitWidth),
      );
    }
  }
}