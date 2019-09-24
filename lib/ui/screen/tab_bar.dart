import 'package:flutter/material.dart';
import 'package:my_meals_flutter_app/ui/screen/meal_screen/meal_screen.dart';
import 'package:my_meals_flutter_app/ui/screen/my_meal_screen/my_meals_screen'
    '.dart';

class TabBarDefault extends StatelessWidget {

  final List<Tab> myTabs = <Tab>[
    Tab(text: 'Dieta', icon: new Icon(Icons.restaurant)),
    Tab(text: 'Refeições Feitas', icon: new Icon(Icons.fastfood)),
  ];

  @override
  Widget build(BuildContext context) {
    return new DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: Text('My Meals App'),
          automaticallyImplyLeading: false,
          elevation: 0.1,
          backgroundColor: Theme.of(context).backgroundColor,
          actions: <Widget>[
            IconButton(
              icon: Icon(Icons.notifications),
              onPressed: () {
                print("Side menu clicked");
              },
            )
          ],
          bottom: TabBar(
            tabs: myTabs,
          ),
        ),
        body: new TabBarView(
          children: [
            MealScreen(),
            MyMealsScreen(),
          ],
        ),
      ),
    );
  }
}