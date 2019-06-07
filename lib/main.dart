import 'package:flutter/material.dart';
import 'package:easy_quote_flutter_app/screens/login_screen.dart';
import 'package:easy_quote_flutter_app/screens/home_screen.dart';

void main() {
  runApp(MaterialApp(
    title: 'Easy Quote App',
    home: LoginScreen(),
    theme: ThemeData(primarySwatch: Colors.blue),
    initialRoute: '/home',
    routes: {
      '/home': (context) => HomeScreen(),
      '/login': (context) => LoginScreen(),
    },
  ));
}