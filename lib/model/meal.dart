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

  Uuid id;
  String name;
  String time;
  String description;
  String recipeLink;
  String type;
  bool isDone;
  String photo;

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

  decodePhoto () {
    Uint8List bytes = base64.decode(this.photo);
    return bytes = bytes.buffer.asUint8List(
        bytes.offsetInBytes, bytes.lengthInBytes
    );
  }

  photoIsEmpty () {
    return photo == null;
  }
}