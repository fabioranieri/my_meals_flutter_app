import 'package:flutter/material.dart';
import 'package:my_meals_flutter_app/model/meal.dart';

import 'meal_photo.dart';

class MyMealCardListItem extends StatelessWidget {
  final List<Meal> items;

  MyMealCardListItem(this.items);

  @override
  Widget build(BuildContext context) {
    Widget cardItem = Container();

    if(items.length > 0) {
      cardItem = Container(
        child: ListView.builder(
          scrollDirection: Axis.vertical,
          shrinkWrap: true,
          itemCount: items.length,
          itemBuilder: (context, index) {
            final item = items[index];
            if(item is Meal) {
              return Card(
                elevation: 3.0,
                margin: new EdgeInsets.symmetric(horizontal: 7.0, vertical: 4.0),
                child: Container(
                  decoration: BoxDecoration(
                      color: Colors.lightBlueAccent[300]
                  ),
                  child: listItem(item, index),
                ),
              );
            }
          },
        ),
      );
    } else {
      cardItem = Center(child: Text('Não existe itens na lista, por favor adicione.'));
    }
    return cardItem;
  }

  Widget listItem (Meal item, int index) {
    return Column(
        children: [
          MealPhoto(item),
          detailsSection(item),
        ]
    );
  }

  //TODO remove this later
/*  AspectRatio mealPhoto(Meal item) {
    if(item.photoIsEmpty()) {
      return AspectRatio(
        aspectRatio: 16.0 / 9.0,
        child: Image.network(
          'https://static-images.ifood.com.br/image/upload/f_auto,t_high/discoveries/ifood_capas_entregagratis_v8_junho_2019.jpg',
          fit: BoxFit.cover,
        ),
      );
    } else {
      return AspectRatio(
        aspectRatio: 16.0 / 9.0,
        child: Image.memory(item.decodePhoto(), fit: BoxFit.fitWidth),
      );
    }
  }*/

  Padding detailsSection(Meal item) {
    return Padding(
      padding: EdgeInsets.all(15.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text( item.name == null ? '' : item.name,
          ),
          // Empty space:
          SizedBox(height: 10.0),
          Row(
            children: [
              Icon(Icons.bookmark, size: 20.0),
              SizedBox(width: 5.0),
              Text( item.type == null ? '' : item.type ),
            ],
          ),
          Row(
            children: [
              Icon(Icons.description, size: 20.0),
              SizedBox(width: 5.0),
              Text( item.description == null ? '' : item.description),
            ],
          ),
        ],
      ),
    );
  }

}