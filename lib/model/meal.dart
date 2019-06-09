import 'package:better_uuid/uuid.dart';

class Meal {
  Uuid id;
  String name;
  DateTime time;
  String description;
  String recipe_link;
  String type;
  bool isDone;

  Meal(
      this.id,
      this.name,
      this.time,
      this.description,
      this.recipe_link,
      this.type,
      this.isDone,
  );
}