import 'package:better_uuid/uuid.dart';

class MyMeal {
  Uuid id;
  String name;
  DateTime time;
  String description;
  String recipeLink;
  String type;
  bool isDone;
  String photo;

  MyMeal(
      this.id,
      this.name,
      this.time,
      this.description,
      this.recipeLink,
      this.type,
      this.isDone,
      this.photo
  );
}