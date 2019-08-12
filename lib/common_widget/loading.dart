import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../main.dart';

class Loading extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    if (!isIOS) {
      return Center(
          key: ValueKey('loadingIndicator'),
          child: CupertinoActivityIndicator()
      );
    }
    return Center(
        key: ValueKey('loadingIndicator'),
        child: CircularProgressIndicator()
    );
  }
}
