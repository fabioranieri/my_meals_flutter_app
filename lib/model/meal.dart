import 'dart:convert';
import 'dart:typed_data';

import 'package:better_uuid/uuid.dart';

class Meal {
  Uuid id;
  String name;
  String time;
  String description;
  String recipeLink;
  String type;
  bool isDone;
  String photo;

  Meal(
      this.id,
      this.name,
      this.time,
      this.description,
      this.recipeLink,
      this.type,
      this.isDone,
      this.photo
  );

  decodePhoto () {
    Uint8List bytes = base64.decode(this.photo);
    return bytes = bytes.buffer.asUint8List(bytes.offsetInBytes, bytes.lengthInBytes);
  }

  photoIsEmpty () {
    return this.photo == null || this.photo.length == 0;
  }

}