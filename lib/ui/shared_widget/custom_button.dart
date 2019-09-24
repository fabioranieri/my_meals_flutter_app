import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    this.child,
    this.onPressed,
    Key key,
  }) : super(key: key);

  final Widget child;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    if (!Platform.isIOS) {
      return CupertinoButton(
        child: child,
        onPressed: onPressed,
        color: Theme.of(context).primaryColor,
      );
    } else {
      return RaisedButton(
        color: Theme.of(context).primaryColor,
        textColor: Colors.white,
        child: child,
        onPressed: onPressed,
      );
    }
  }
}