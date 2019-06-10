import 'package:flutter/material.dart';
import 'package:my_meals_flutter_app/screens/login_screen.dart';
import 'package:my_meals_flutter_app/screens/home_screen.dart';
import 'package:my_meals_flutter_app/screens/take_picture_screen.dart';
import 'package:my_meals_flutter_app/model/meal.dart';
import 'package:better_uuid/uuid.dart';

void main() {
  runApp(MaterialApp(
    title: 'My Meals App',
    home: LoginScreen(),
    theme: ThemeData(primarySwatch: Colors.blue),
    initialRoute: '/home',
    routes: {
      '/home': (context) => HomeScreen(
        items: List<Meal>.generate(13,
              (i) => Meal(
                  Uuid.v4(),
                  "Lunch " + i.toString(),
                  DateTime.now(),
                  "Frango com Ovo",
                  "-",
                  "Lunch",
                  true,
                  ""
              ),
        )
      ),
      '/take-picture': (context) =>  TakePictureScreen()
      //'/login': (context) => LoginScreen(),
    },
  ));
}