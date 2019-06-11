import 'package:flutter/material.dart';
import 'package:my_meals_flutter_app/screens/home_screen.dart';


class TabBarDefault extends StatelessWidget {

  final List<Tab> myTabs = <Tab>[
    Tab(text: 'LEFT'),
    Tab(text: 'RIGHT'),
  ];

  @override
  Widget build(BuildContext context) {
    textStyle() {
      return new TextStyle(color: Colors.white, fontSize: 30.0);
    }

    return new DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: Text('My Meals App'),
          automaticallyImplyLeading: false,
          elevation: 0.1,
          backgroundColor: Colors.redAccent,
          bottom: TabBar(
            tabs: myTabs,
          ),
        ),
        body: new TabBarView(
          children: [
          HomeScreen(),
          HomeScreen(),
          ],
        ),
      ),
    );
  }
}