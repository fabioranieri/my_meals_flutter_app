import 'dart:collection';
import 'package:better_uuid/uuid.dart';
import 'package:flutter/material.dart';
import 'package:my_meals_flutter_app/model/meal.dart';

// reference: https://flutter.dev/docs/development/data-and-backend/state-mgmt/simple
class MealList extends ChangeNotifier {

  final List<Meal> _meallist = [
    Meal(Uuid.v4(),
        "Café da manhã" ,
        DateTime.now(),
        "Torrada integral, ovo e leite de soja.",
        "-",
        "Café da manhã",
        false,
        ""
    ),
    Meal(Uuid.v4(),
        "Iogurte ou uma fruta" ,
        DateTime.now(),
        "Activia ou uma banana prata.",
        "-",
        "Lanche",
        false,
        ""
    ),
    Meal(Uuid.v4(),
        "Almoço" ,
        DateTime.now(),
        "Batata doce, frango grelhado e salada.",
        "-",
        "Comida",
        false,
        ""
    ),
    Meal(Uuid.v4(),
        "Fruta" ,
        DateTime.now(),
        "Maça, pera, melancia ou laranja",
        "-",
        "Lanche",
        false,
        ""
    ),
    Meal(Uuid.v4(),
        "Janta" ,
        DateTime.now(),
        "Batata doce, frango grelhado e salada.",
        "-",
        "Comida",
        false,
        ""
    ),
    Meal(Uuid.v4(),
        "3 Ovos" ,
        DateTime.now(),
        "Ovos cozidos",
        "-",
        "Lanche",
        false,
        ""
    ),
  ];

  UnmodifiableListView<Meal> get meallist => UnmodifiableListView(_meallist);

  int get itemsQtd => _meallist.length;

  void add(Meal meal) {
    _meallist.add(meal);
    notifyListeners();
  }
}