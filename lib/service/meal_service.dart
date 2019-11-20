import 'dart:convert' as convert;
import 'package:http/http.dart' as  http;
import 'package:my_meals_flutter_app/model/meal.dart';

class MealService {
  Meal meal = Meal();

  Future<List<Meal>> fetchAll() async {
    var url = 'https://my-meals-1f1dd.firebaseio.com/meals.json';
    var response = await http.get(url);
    if (response.statusCode == 200) {
      var jsonResponse = convert.jsonDecode(response.body);
      List<Meal> mealList = meal.mealListFromJson(jsonResponse);
      return Future.value(mealList);
    }
    return Future.error(
        Exception('Request failed with status: ${response.statusCode}.')
    );
  }
}