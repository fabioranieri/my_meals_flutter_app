import 'package:flutter/material.dart';
import 'package:my_meals_flutter_app/model/meal.dart';

class ListItem extends StatelessWidget {
  const ListItem({this.item, this.index, this.mealDetails});
  final Meal item;
  final int index;
  final Function mealDetails;

  @override
  Widget build(BuildContext context) {
    return ListTile(
        contentPadding: const EdgeInsets.symmetric(
            horizontal: 7.0, vertical: 3.0,
        ),
        leading: Container(
          padding: const EdgeInsets.only(right: 1.0),
          decoration: BoxDecoration(
            border: Border(
              right: BorderSide(width: 1.0, color: Colors.white24),
            ),
          ),
          child: Icon(
              Icons.fastfood,
              color: Theme.of(context).primaryColor,
              size: 30.0
          ),
        ),
        title: Text(
          item.name,
          style: TextStyle(fontWeight: FontWeight.w700),
        ),
        subtitle: Row(
          children: <Widget>[
            Expanded(
                flex: 4,
                child: Container(
                  child: Text(item.description),
                )),
            Expanded(
              flex: 2,
              child: Padding(
                padding: const EdgeInsets.only(left: 10.0),
                child: Text(item.type,),
              ),
            )
          ],
        ),
        onTap: () => mealDetails(item)
    );
  }
}