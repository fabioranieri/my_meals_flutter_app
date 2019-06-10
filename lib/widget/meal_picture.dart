import 'package:flutter/material.dart';
import 'dart:io';

class MealPicture extends StatelessWidget {
  final String imagePath;

  const MealPicture({Key key, this.imagePath}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Image.file(File(imagePath)),
    );
  }
}