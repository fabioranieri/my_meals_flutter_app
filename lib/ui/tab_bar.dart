import 'package:flutter/material.dart';
import 'package:my_meals_flutter_app/ui/meal_list/meal_list_screen.dart';
import 'package:my_meals_flutter_app/ui/my_meal_list/my_meals_screen.dart';

class TabBarDefault extends StatelessWidget {

  final List<Tab> myTabs = <Tab>[
    Tab(text: 'Dieta', icon: Icon(Icons.restaurant)),
    Tab(text: 'Refeições Feitas', icon: Icon(Icons.fastfood)),
  ];

  @override
  Widget build(BuildContext context) {
    return  DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('My Meals App'),
          automaticallyImplyLeading: false,
          elevation: 0.1,
          backgroundColor: Theme.of(context).backgroundColor,
          actions: <Widget>[
            IconButton(
              icon: Icon(Icons.notifications),
              onPressed: () {
                print('Side menu clicked');
              },
            )
          ],
          bottom: TabBar(
            tabs: myTabs,
          ),
        ),
        body: TabBarView(
          children: const [
            MealListScreen(),
            MyMealsScreen(),
          ],
        ),
      ),
    );
  }
}