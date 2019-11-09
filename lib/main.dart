import 'package:flutter/material.dart';
import 'package:my_meals_flutter_app/ui/meal_list/meal_list_screen.dart';
import 'package:my_meals_flutter_app/ui/my_meal_list/my_meals_screen.dart';
import 'package:provider/provider.dart';
import 'package:my_meals_flutter_app/ui/tab_bar.dart';
import 'package:my_meals_flutter_app/shared_state/meal_list.dart';
import 'package:my_meals_flutter_app/shared_state/my_meal_list.dart';

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
              '/home': (context) => const MealListScreen(),
              '/my-meal': (context) =>  const MyMealsScreen(),
            },
          )
      )
  );
}