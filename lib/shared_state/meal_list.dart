import 'dart:collection';
import 'package:flutter/material.dart';
import 'package:my_meals_flutter_app/model/meal.dart';

class MealList extends ChangeNotifier {

  final List<Meal> _meallist = [];

  UnmodifiableListView<Meal> get meallist => UnmodifiableListView(_meallist);
  int get itemsQtd => _meallist.length;

  void add(Meal meal) {
    _meallist.add(meal);
    notifyListeners();
  }
}