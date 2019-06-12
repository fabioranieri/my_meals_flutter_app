import 'package:flutter/material.dart';
import 'package:my_meals_flutter_app/common_widget/add_meal_fab_button.dart';
import 'package:my_meals_flutter_app/screen/my_meal_screen/my_meal_card_list_item.dart';
import 'package:my_meals_flutter_app/model/meal.dart';
import 'package:my_meals_flutter_app/shared_state/my_meal_list.dart';
import 'package:provider/provider.dart';

class MyMealsScreen extends StatefulWidget {
  final List<Meal> items;

  const MyMealsScreen({Key key, this.items}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _MyMealsScreenState(items: this.items);
  }
}

class _MyMealsScreenState extends State<MyMealsScreen> {
  List<Meal> items;
  _MyMealsScreenState({Key key, @required this.items});

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    final _mymeallist = Provider.of<MyMealList>(context);

    return Scaffold(
      body: MyMealCardListItem(_mymeallist.mymeallist),
      floatingActionButton: AddMealFabButton(),
    );
  }
}