import 'package:flutter/material.dart';
import 'package:my_meals_flutter_app/ui/shared_widget/add_meal_fab_button.dart';
import 'package:my_meals_flutter_app/ui/my_meal_list/my_meal_card_list.dart';
import 'package:my_meals_flutter_app/model/meal.dart';
import 'package:my_meals_flutter_app/shared_state/my_meal_list.dart';
import 'package:provider/provider.dart';

class MyMealsScreen extends StatefulWidget {
  const MyMealsScreen({Key key, this.items}) : super(key: key);
  final List<Meal> items;

  @override
  State<StatefulWidget> createState() {
    return _MyMealsScreenState(items: items);
  }
}

class _MyMealsScreenState extends State<MyMealsScreen> {
  _MyMealsScreenState({Key key, @required this.items});
  List<Meal> items;

  @override
  Widget build(BuildContext context) {
    final _myMealList = Provider.of<MyMealList>(context);
    return Scaffold(
      body: MyMealCardListItem(_myMealList.myMeallist),
      floatingActionButton: const AddMealFabButton(),
    );
  }
}