import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:my_meals_flutter_app/model/meal.dart';
import 'package:my_meals_flutter_app/widget/meal_details_save_form.dart';
import 'dart:io';

class MealDetailsScreen extends StatefulWidget {
  final Meal meal;

  const MealDetailsScreen({Key key, this.meal}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    print('[MealDetailsScreen Widget] createState()');
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
    print("_setMealPhoto" + photo.toString());
    File imageFile = new File(photo);
    List<int> imageBytes = imageFile.readAsBytesSync();
    String base64Image = base64.encode(imageBytes);
    setState(() {_meal.photo = base64Image;});
  }

  void _addMeal(Meal meal) {
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Detalhes da refeição'),
        elevation: 0.1,
          backgroundColor: Colors.redAccent,
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