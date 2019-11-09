import 'package:flutter/material.dart';
import 'package:my_meals_flutter_app/model/meal.dart';
import 'package:my_meals_flutter_app/service/meal_service.dart';
import 'package:my_meals_flutter_app/ui/meal_details/meal_details_screen.dart';
import 'package:my_meals_flutter_app/ui/meal_list/meal_card_list.dart';
import 'package:my_meals_flutter_app/ui/shared_widget/loading.dart';
import 'package:my_meals_flutter_app/shared_state/meal_list.dart';
import 'package:provider/provider.dart';

class MealListScreen extends StatefulWidget {
  const MealListScreen();

  @override
  State<StatefulWidget> createState() => _MealScreenState();
}

class _MealScreenState extends State<MealListScreen> {
  _MealScreenState();
  List<Meal> _items;
  MealService mealService;

  @override
  void initState() {
    super.initState();
    mealService = MealService();
    _fetchAllMeal();
    _items = [];
  }

  void _fetchAllMeal() {
    mealService.fetchAll().then((onValue) {
      setState(() {
        _items = onValue;
      });
    }).catchError((onError) {
      print('catchError: $onError');
    });
  }

  void _mealDetails(Meal meal) {
    // final _mealList = Provider.of<MealList>(context);
    // Meal meal = _mealList.meallist[position];
    Navigator.push(context,
      MaterialPageRoute(builder: (context) => MealDetailsScreen(meal: meal)),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<MealList>(
        builder: (context, _mealList, child) {
          return Scaffold(
            body: _items.length == 0
                ? Loading()
                : MealCardListItem(items: _items, mealDetails: _mealDetails),
          );
        }
    );
  }
}