import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:my_meals_flutter_app/screens/home_screen.dart';
import 'package:my_meals_flutter_app/screens/tab_bar.dart';
import 'package:my_meals_flutter_app/screens/take_picture_screen.dart';
import 'package:my_meals_flutter_app/shared_state/meal_list.dart';

void main() {
  runApp(
      MultiProvider(
          providers: [
            ChangeNotifierProvider(builder: (context) => MealList()),
          ],
          child: MaterialApp(
            title: 'My Meals App',
            home: TabBarDefault(),
            theme: ThemeData(primarySwatch: Colors.blue),
            initialRoute: '/tabbar-default',
            routes: {
              '/tabbar-default': (context) => TabBarDefault(),
              '/home': (context) => HomeScreen(),
              '/take-picture': (context) =>  TakePictureScreen()
            },
          )
      )
  );
}