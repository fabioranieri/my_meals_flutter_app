import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Loading extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    if (Platform.isIOS) {
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
