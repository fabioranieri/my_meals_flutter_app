import 'package:flutter/material.dart';
import 'package:my_meals_flutter_app/model/my_meal.dart';

class MyMealCardListItem extends StatelessWidget {
  final List<MyMeal> items;

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
            if(item is MyMeal) {
              return Card(
                elevation: 3.0,
                margin: new EdgeInsets.symmetric(horizontal: 7.0, vertical: 4.0),
                child: Container(
                  decoration: BoxDecoration(
                      color: Colors.lightBlueAccent[300]
                  ),
                  child: ListItem(item, index),
                ),
              );
            }
          },
        ),
      );
    } else {
      cardItem = Center(child: Text('No items found, please add some!'));
    }
    return cardItem;
  }

  Widget ListItem (MyMeal item, int index) {
     return ListTile(
      contentPadding: EdgeInsets.symmetric(horizontal: 7.0, vertical: 3.0),
      leading: Container(
        padding: EdgeInsets.only(right: 1.0),
        decoration: new BoxDecoration(
            border: new Border(
                right: new BorderSide(width: 1.0, color: Colors.white24))),
        child: Icon(Icons.fastfood, color: Colors.black26, size: 30.0),
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
                 padding: EdgeInsets.only(left: 10.0),
                 child: Text(item.type,)
             ),
           )
         ],
       ),
      trailing:
        new Checkbox(value: item.isDone, onChanged: (value) {
        print('[Checkbox] onChanged' + value.toString());
        // updateMeal(index);
      }),
      onTap: () {
        print("[ListItem] onTap");
        // updateMeal(index);
      },
    );
  }
}