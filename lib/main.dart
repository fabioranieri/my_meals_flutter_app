import 'package:flutter/material.dart';
import 'package:my_meals_flutter_app/screen/my_meal_screen/my_meals_screen.dart';
import 'package:provider/provider.dart';
import 'package:my_meals_flutter_app/screen/meal_screen/meal_screen.dart';
import 'package:my_meals_flutter_app/screen/tab_bar.dart';
import 'package:my_meals_flutter_app/screen/take_picture_screen.dart';
import 'package:my_meals_flutter_app/shared_state/meal_list.dart';
import 'package:my_meals_flutter_app/shared_state/my_meal_list.dart';
import 'package:flutter/foundation.dart' as foundation;

import 'common_widget/custom_app.dart';

bool get isIOS => foundation.defaultTargetPlatform == TargetPlatform.iOS;

void main() {
  runApp(
      MultiProvider(
          providers: [
            ChangeNotifierProvider( builder: (context) => MealList()),
            ChangeNotifierProvider( builder: (context) => MyMealList()),
          ],
          child: MaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'My Meals App',
            home: TabBarDefault(),
            theme: ThemeData(
              primarySwatch: Colors.red,
              brightness: Brightness.light,
              primaryColor: Colors.red[800],
              accentColor: Colors.redAccent,
              fontFamily: 'Montserrat',
              backgroundColor: Colors.red[800],
            ),
            initialRoute: '/tabbar-default',
            routes: {
              '/tabbar-default': (context) => TabBarDefault(),
              '/home': (context) => MealScreen(),
              '/my-meal': (context) =>  MyMealsScreen(),
              '/take-picture': (context) =>  TakePictureScreen()
            },
          )
      )
  );
}