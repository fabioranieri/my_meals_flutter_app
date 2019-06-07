import 'package:flutter/material.dart';
import 'package:easy_quote_flutter_app/screens/login_screen.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home'),
        automaticallyImplyLeading: false,
      ),
      body: Center(
        child: RaisedButton(
          child: Text('Home'),
          onPressed: () {
            // Navigator.pop(context);
            // Navigator.push(context, MaterialPageRoute(builder: (context) => LoginScreen()));
          },
        ),
      ),
    );
  }
}
