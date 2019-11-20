import 'dart:collection';
import 'package:flutter/material.dart';
import 'package:my_meals_flutter_app/model/meal.dart';

class MyMealList extends ChangeNotifier {

  final List<Meal> _myMeallist = [];
  UnmodifiableListView<Meal> get myMeallist =>
      UnmodifiableListView(_myMeallist);

  int get itemsQtd => _myMeallist.length;

  void add(Meal meal) {
    _myMeallist.add(meal);
    notifyListeners();
  }
}