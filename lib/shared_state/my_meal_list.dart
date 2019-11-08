import 'dart:collection';
import 'package:better_uuid/uuid.dart';
import 'package:flutter/material.dart';
import 'package:my_meals_flutter_app/model/meal.dart';

class MyMealList extends ChangeNotifier {

  final List<Meal> _mymeallist = [
    Meal(id: Uuid.v4(),
        name: "Café da manhã" ,
        time: "08:00",
        description: "Torrada integral, ovo e leite de soja.",
        recipeLink: "-",
        type: "Café da manhã",
        isDone: false,
    ),
  ];

  UnmodifiableListView<Meal> get mymeallist => UnmodifiableListView(_mymeallist);

  int get itemsQtd => _mymeallist.length;

  void add(Meal meal) {
    _mymeallist.add(meal);
    notifyListeners();
  }
}