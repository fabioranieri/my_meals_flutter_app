
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:my_meals_flutter_app/ui/meal_list/meal_list_screen.dart';
import 'package:my_meals_flutter_app/ui/my_meal_list/my_meals_screen.dart';
import 'package:my_meals_flutter_app/ui/tab_bar.dart';
import 'package:my_meals_flutter_app/ui/shared_widget/take_picture.dart';

class CustomApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    if (Platform.isIOS) {
      return CupertinoApp(
        title: 'My Meals App',
        home: TabBarDefault(),
        debugShowCheckedModeBanner: false,
        theme: CupertinoThemeData(
          primaryColor: Colors.red[800],
        ),
        initialRoute: '/tabbar-default',
        routes: {
          '/tabbar-default': (context) => TabBarDefault(),
          '/home': (context) => MealListScreen(),
          '/my-meal': (context) =>  MyMealsScreen(),
          '/take-picture': (context) =>  TakePictureScreen()
        },
      );
    } else {
      return MaterialApp(
        title: 'My Meals App',
        home: TabBarDefault(),
        debugShowCheckedModeBanner: false,
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
          '/home': (context) => MealListScreen(),
          '/my-meal': (context) =>  MyMealsScreen(),
          '/take-picture': (context) =>  TakePictureScreen()
        },
      );
    }
  }
}