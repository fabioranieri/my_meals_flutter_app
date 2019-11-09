import 'dart:convert';
import 'dart:typed_data';

import 'package:better_uuid/uuid.dart';

class Meal {
  Meal({
    this.id,
    this.name,
    this.time,
    this.description,
    this.recipeLink,
    this.type,
    this.isDone,
    this.photo
  });

  Meal.fromJson(Map<String, dynamic> json) {
    id = Uuid.v4();
    name = json['name'];
    time = json['time'];
    description = json['description'];
    recipeLink = json['recipeLink'];
    type = json['type'];
    isDone = json['isDone'];
    photo = json['photo'] ?? '';
  }

  Uuid id;
  String name;
  String time;
  String description;
  String recipeLink;
  String type;
  bool isDone;
  String photo;

  Uint8List decodePhoto () {
    Uint8List bytes = base64.decode(photo);
    return bytes = bytes.buffer.asUint8List(
        bytes.offsetInBytes, bytes.lengthInBytes
    );
  }

  bool photoIsEmpty () {
    return photo == null;
  }
}