import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:my_meals_flutter_app/model/meal.dart';
import 'package:my_meals_flutter_app/shared_state/my_meal_list.dart';
import 'package:my_meals_flutter_app/ui/meal_details/meal_details_form.dart';
import 'package:provider/provider.dart';

class MealDetailsScreen extends StatefulWidget {
  const MealDetailsScreen({Key key, this.meal}) : super(key: key);
  final Meal meal;

  @override
  State<StatefulWidget> createState() {
    return _MealDetailsState(meal: meal);
  }
}

class _MealDetailsState extends State<MealDetailsScreen> {
  _MealDetailsState({Key key, @required this.meal});
  Meal _meal;
  Meal meal;

  @override
  void initState() {
    super.initState();
    setState(() {_meal = meal;});
  }

  void _setMealPhoto(String photo) {
    File imageFile = File(photo);
    List<int> imageBytes = imageFile.readAsBytesSync();
    String base64Image = base64.encode(imageBytes);
    setState(() {_meal.photo = base64Image;});
  }

  void _addMeal(Meal meal) {
    final _mealList = Provider.of<MyMealList>(context);
    _mealList.add(meal);
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Registrar Refeição Feita'),
          elevation: 0.1,
          backgroundColor: Theme.of(context).primaryColor,
        ),
        body: MealDetailsSaveForm(
          meal: _meal,
          addMeal: _addMeal,
          updateMeal: () {},
          setMealPhoto: _setMealPhoto,
        ),
    );
  }
}