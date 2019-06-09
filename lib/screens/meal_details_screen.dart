import 'package:flutter/material.dart';
import 'package:my_meals_flutter_app/model/meal.dart';
import 'package:my_meals_flutter_app/widget/meal_details_save_form.dart';

class MealDetailsScreen extends StatefulWidget {
  final Meal item;

  const MealDetailsScreen({Key key, this.item}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    print('[MealDetailsScreen Widget] createState()');
    return _MealDetailsState(item: this.item);
  }
}

class _MealDetailsState extends State<MealDetailsScreen> {

  Meal item;
  _MealDetailsState({Key key, @required this.item});

  @override
  void initState() {
    super.initState();
    setState(() {item;});
  }

  // item: this.item, addMeal: _addMeal
  void _updateMeal(Meal item) {
    Meal meal = item;
    //TODO past to home screen
    /*Navigator.push(context,
      MaterialPageRoute(builder: (context) => MealDetailsScreen(item: meal)),
    );*/
  }

  void _addMeal(Meal item) {
    Meal meal = item;
    //TODO past to home screen
    /*Navigator.push(context,
      MaterialPageRoute(builder: (context) => MealDetailsScreen(item: meal)),
    );*/
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Detalhes da refeição'),
        elevation: 0.1,
          backgroundColor: Colors.redAccent,
      ),
      body: MealDetailsSaveForm(item: item, addMeal: _addMeal, updateMeal: _updateMeal)
    );
  }
}