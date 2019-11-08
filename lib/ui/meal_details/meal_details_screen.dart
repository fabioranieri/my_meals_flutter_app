import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:my_meals_flutter_app/model/meal.dart';
import 'package:my_meals_flutter_app/shared_state/my_meal_list.dart';
import 'package:my_meals_flutter_app/ui/meal_details/meal_details_form.dart';
import 'dart:io';
import 'package:provider/provider.dart';

class MealDetailsScreen extends StatefulWidget {
  MealDetailsScreen({Key key, this.meal}) : super(key: key);
  final Meal meal;

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

  void _setMealPhoto(String photo) {

    print('_setMealPhoto');
    print(_setMealPhoto);
    print(photo);

    File imageFile = new File(photo);
    List<int> imageBytes = imageFile.readAsBytesSync();
    String base64Image = base64.encode(imageBytes);
    setState(() {_meal.photo = base64Image;});
    print(_meal.photo);
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