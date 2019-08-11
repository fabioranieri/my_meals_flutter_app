import 'dart:collection';
import 'package:better_uuid/uuid.dart';
import 'package:flutter/material.dart';
import 'package:my_meals_flutter_app/model/meal.dart';

// reference: https://flutter.dev/docs/development/data-and-backend/state-mgmt/simple
class MealList extends ChangeNotifier {

  final List<Meal> _meallist = [
    Meal(Uuid.v4(),
        "Café da manhã" ,
        "08:00",
        "Torrada integral, ovo e leite de soja.",
        "-",
        "Café da manhã",
        false,
        ""
    ),
    Meal(Uuid.v4(),
        "Iogurte ou uma fruta" ,
        "08:00",
        "Activia ou uma banana prata.",
        "-",
        "Lanche",
        false,
        ""
    ),
    Meal(Uuid.v4(),
        "Almoço" ,
        "08:00",
        "Batata doce, frango grelhado e salada.",
        "-",
        "Comida",
        false,
        ""
    ),
    Meal(Uuid.v4(),
        "Fruta" ,
        "08:00",
        "Maça, pera, melancia ou laranja",
        "-",
        "Lanche",
        false,
        ""
    ),
    Meal(Uuid.v4(),
        "Janta" ,
        "08:00",
        "Batata doce, frango grelhado e salada.",
        "-",
        "Comida",
        false,
        ""
    ),
    Meal(Uuid.v4(),
        "3 Ovos" ,
        "08:00",
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