import 'package:flutter/material.dart';
import 'package:my_meals_flutter_app/screens/meal_details_screen.dart';
import 'package:my_meals_flutter_app/widget/meal_card_list_item.dart';
import 'package:my_meals_flutter_app/model/meal.dart';
import 'package:my_meals_flutter_app/shared_state/meal_list.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  final List<Meal> items;

  const HomeScreen({Key key, this.items}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    print('[HomeScreen Widget] createState()');
    return _HomeScreenState(items: this.items);
  }
}

class _HomeScreenState extends State<HomeScreen> {
  List<Meal> items;
  _HomeScreenState({Key key, @required this.items});

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