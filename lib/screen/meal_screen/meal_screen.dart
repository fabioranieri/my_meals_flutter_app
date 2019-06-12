import 'package:flutter/material.dart';
import 'package:my_meals_flutter_app/screen/meal_details_screen/meal_details_screen.dart';
import 'package:my_meals_flutter_app/screen/meal_screen/meal_card_list_item.dart';
import 'package:my_meals_flutter_app/model/meal.dart';
import 'package:my_meals_flutter_app/shared_state/meal_list.dart';
import 'package:provider/provider.dart';

class MealScreen extends StatefulWidget {
  final List<Meal> items;

  const MealScreen({Key key, this.items}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _MealScreenState(items: this.items);
  }
}

class _MealScreenState extends State<MealScreen> {
  List<Meal> items;
  _MealScreenState({Key key, @required this.items});

  @override
  void initState() {
    super.initState();
  }

  void _updateDetails(int position) {
    final _meallist = Provider.of<MealList>(context);
    Meal meal = _meallist.meallist[position];
    Navigator.push(context,
      MaterialPageRoute(builder: (context) => MealDetailsScreen(meal: meal)),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<MealList>(
        builder: (context, _meallist, child) {
          return Scaffold(
            body: MealCardListItem(_meallist.meallist, _updateDetails),
            // floatingActionButton: AddMealFabButton(),
          );}
    );
  }
}