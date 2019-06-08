import 'package:flutter/material.dart';
import 'package:easy_quote_flutter_app/screens/login_screen.dart';
import 'package:easy_quote_flutter_app/screens/home_screen.dart';
import 'package:easy_quote_flutter_app/model/supplier.dart';
import 'package:better_uuid/uuid.dart';

void main() {
  runApp(MaterialApp(
    title: 'Easy Quote App',
    home: LoginScreen(),
    theme: ThemeData(primarySwatch: Colors.blue),
    initialRoute: '/home',
    routes: {
      '/home': (context) => HomeScreen(
        items: List<Supplier>.generate(7,
              (i) => Supplier(
                  Uuid.v4(),
                  "Carlos H." + i.toString(),
                  "Av. Artemio Dorsa, 120" + i.toString(),
                  "carlos@quicktech.no",
                  "twitter.com",
                  "Software",
                  true
              ),
        )
      ),
      '/login': (context) => LoginScreen(),
    },
  ));
}