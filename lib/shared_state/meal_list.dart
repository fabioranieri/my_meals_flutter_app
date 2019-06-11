import 'dart:collection';
import 'package:better_uuid/uuid.dart';
import 'package:flutter/material.dart';
import 'package:my_meals_flutter_app/model/meal.dart';

// reference: https://flutter.dev/docs/development/data-and-backend/state-mgmt/simple
// https://medium.com/flutter-community/flutter-pragmatic-state-management-using-provider-5c1129f9b5bb
class MealList extends ChangeNotifier {
  /// Internal, private state of the MealList.
  final List<Meal> _meallist = List<Meal>.generate(13, (i) => Meal(
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
  UnmodifiableListView<Meal> get meallist => UnmodifiableListView(_meallist);

  /// The current qtd of itens.
  int get itemsQtd => _meallist.length;

  /// Adds [meal] to _meallist. This is the only way to modify the _meallist from outside.
  void add(Meal meal) {
    _meallist.add(meal);
    // This call tells the widgets that are listening to this model to rebuild.
    notifyListeners();
  }
}