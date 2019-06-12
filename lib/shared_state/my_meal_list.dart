import 'dart:collection';
import 'package:better_uuid/uuid.dart';
import 'package:flutter/material.dart';
import 'package:my_meals_flutter_app/model/meal.dart';

class MyMealList extends ChangeNotifier {
  /// Internal, private state of the MealList.
  final List<Meal> _mymeallist = List<Meal>.generate(1, (i) => Meal(
      Uuid.v4(),
      "Lunch " + i.toString(),
      DateTime.now(),
      "Frango com Ovo",
      "-",
      "Lunch",
      true,
      ""
  ));

  /// An unmodifiable view of the items
  UnmodifiableListView<Meal> get mymeallist => UnmodifiableListView(_mymeallist);

  /// The current qtd of itens.
  int get itemsQtd => _mymeallist.length;

  /// Adds [mymeal] to _mymeallist. This is the only way to modify the _mymeallist from outside.
  void add(Meal meal) {
    _mymeallist.add(meal);
    // This call tells the widgets that are listening to this model to rebuild.
    notifyListeners();
  }
}