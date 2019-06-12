import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:my_meals_flutter_app/model/meal.dart';
import 'package:my_meals_flutter_app/shared_state/my_meal_list.dart';
import 'package:my_meals_flutter_app/widget/meal_details_save_form.dart';
import 'dart:io';
import 'package:provider/provider.dart';

class MealDetailsScreen extends StatefulWidget {
  final Meal meal;

  const MealDetailsScreen({Key key, this.meal}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _MealDetailsState(meal: this.meal);
  }
}

class _MealDetailsState extends State<MealDetailsScreen> {
  Meal _meal;
  Meal meal;
  _MealDetailsState({Key key, @required this.meal});

  @override
  void initState() {
    super.initState();
    setState(() {_meal = meal;});
  }

  void _updateMeal(Meal item) {
  }

  void _setMealPhoto(String photo) {
    File imageFile = new File(photo);
    List<int> imageBytes = imageFile.readAsBytesSync();
    String base64Image = base64.encode(imageBytes);
    print(_meal.photo);
    setState(() {_meal.photo = base64Image;});
    print(_meal.photo);
  }

  void _addMeal(Meal meal) {
    final _meallist = Provider.of<MyMealList>(context);
    _meallist.add(meal);
    print('[_meallist] - _addMeal' + _meallist.toString());
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Registrar Refeição Feita'),
        elevation: 0.1,
          backgroundColor: Theme.of(context).primaryColor,
      ),
      body: MealDetailsSaveForm(
          meal: _meal,
          addMeal: _addMeal,
          updateMeal: _updateMeal,
          setMealPhoto: _setMealPhoto,
      )
    );
  }
}