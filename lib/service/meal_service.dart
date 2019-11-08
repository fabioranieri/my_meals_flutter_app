import 'dart:convert' as convert;
import 'package:better_uuid/uuid.dart';
import 'package:http/http.dart' as  http;
import 'package:my_meals_flutter_app/model/meal.dart';

class MealService {

  Future<List<Meal>> fetchAll() async {
    var url = "https://my-meals-1f1dd.firebaseio.com/meals.json";
    var response = await http.get(url);
    if (response.statusCode == 200) {
      var jsonResponse = convert.jsonDecode(response.body);
      var mealList = _convertToMealList(jsonResponse);
      return Future.value(mealList);
    }
    return Future.error(Exception("Request failed with status: ${response.statusCode}."));
  }

  List<Meal> _convertToMealList(Map<String, dynamic> jsonResponse) {
    List<Meal> mealList = [];
    jsonResponse.forEach((key, item) {
      mealList.add(Meal(
        id: Uuid.v4(),
        name: item['name'],
        time: item['time'],
        description: item['description'],
        recipeLink: item['recipeLink'],
        type: item['type'],
        isDone: item['isDone'],
        photo: item['photo'] ?? '',
      ));
    });
    return mealList;
  }
}