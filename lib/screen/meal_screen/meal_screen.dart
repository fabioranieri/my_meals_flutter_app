import 'package:flutter/material.dart';
import 'package:my_meals_flutter_app/screen/meal_details_screen/meal_details_screen.dart';
import 'package:my_meals_flutter_app/screen/meal_screen/meal_card_list_item.dart';
import 'package:my_meals_flutter_app/model/meal.dart';
import 'package:my_meals_flutter_app/service/meal_service.dart';
import 'package:my_meals_flutter_app/shared_state/Loading.dart';
import 'package:my_meals_flutter_app/shared_state/meal_list.dart';
import 'package:provider/provider.dart';

class MealScreen extends StatefulWidget {

  const MealScreen();

  @override
  State<StatefulWidget> createState() {
    return _MealScreenState();
  }
}

class _MealScreenState extends State<MealScreen> {
  List<Meal> _items;
  _MealScreenState();
  MealService mealService;

  @override
  void initState() {
    super.initState();
    mealService = MealService();
    fetchAllMeal();
    _items = [];
  }

  void fetchAllMeal() {
    mealService.fetchAll()
        .then((onValue) {
      print("fetchAllMeal: $onValue");
      setState(() {
        _items = onValue;
      });
    })
        .catchError((onError) {
      print("catchError: $onError");
    });
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
            body: _items.length == 0
                ? Loading()
                : MealCardListItem(_items, _updateDetails),
            //TODO replace to use Statte manager
            // body: MealCardListItem(_meallist.meallist, _updateDetails),
          );}
    );
  }
}