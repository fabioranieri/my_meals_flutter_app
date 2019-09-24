import 'package:flutter/material.dart';
import 'package:my_meals_flutter_app/model/meal.dart';

import 'my_meal_card_item.dart';

class MyMealCardListItem extends StatelessWidget {
  MyMealCardListItem(this.items);
  final List<Meal> items;

  @override
  Widget build(BuildContext context) {
    if(items.length > 0) {
      return Container(
        child: ListView.builder(
            scrollDirection: Axis.vertical,
            shrinkWrap: true,
            itemCount: items.length,
            itemBuilder: (context, index) {
              return Card(
                elevation: 3.0,
                margin: EdgeInsets.symmetric(horizontal: 7.0, vertical: 4.0),
                child: Container(
                  decoration: BoxDecoration(
                      color: Colors.lightBlueAccent[300]
                  ),
                  child: MyMealCardItem(items[index], index),
                ),
              );
            }
        ),
      );
    }
    return Center(child: Text('No items found, please add some.'));
  }
}