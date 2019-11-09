import 'dart:collection';
import 'package:better_uuid/uuid.dart';
import 'package:flutter/material.dart';
import 'package:my_meals_flutter_app/model/meal.dart';

class MealList extends ChangeNotifier {

  final List<Meal> _meallist = [
    Meal(id: Uuid.v4(),
        name: 'Café da manhã',
        time: '08:00',
        description: 'Torrada integral, ovo e leite de soja.',
        recipeLink: '-',
        type: 'Café da manhã',
        isDone: false,
        photo: ''
    ),
  ];

  UnmodifiableListView<Meal> get meallist => UnmodifiableListView(_meallist);

  int get itemsQtd => _meallist.length;

  void add(Meal meal) {
    _meallist.add(meal);
    notifyListeners();
  }
}