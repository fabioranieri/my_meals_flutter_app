import 'package:flutter/material.dart';
import 'package:my_meals_flutter_app/screens/home_screen.dart';
import 'package:my_meals_flutter_app/screens/take_picture_screen.dart';
import 'package:my_meals_flutter_app/model/meal.dart';
import 'package:my_meals_flutter_app/shared_state/meal_list.dart';

import 'package:better_uuid/uuid.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
      MultiProvider(
          providers: [
            ChangeNotifierProvider(builder: (context) => MealList()),
          ],
          child: MaterialApp(
            title: 'My Meals App',
            home: HomeScreen(),
            theme: ThemeData(primarySwatch: Colors.blue),
            initialRoute: '/home',
            routes: {
              '/home': (context) => HomeScreen(),
              '/take-picture': (context) =>  TakePictureScreen()
              //'/login': (context) => LoginScreen(),
            },
          )
      )
  );
}