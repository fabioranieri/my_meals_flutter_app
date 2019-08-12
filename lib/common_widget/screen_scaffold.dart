
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../main.dart';

class AdaptivePageScaffold extends StatelessWidget {
  const AdaptivePageScaffold({
    @required this.title,
    @required this.child,
  })  : assert(title != null),
        assert(child != null);

  final String title;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    if (isIOS) {
      return CupertinoPageScaffold(
        navigationBar: CupertinoNavigationBar(
          middle: Text(title),
        ),
        resizeToAvoidBottomInset: false,
        child: child,
      );
    } else {
      return Scaffold(
        appBar: AppBar(
          title: Text(title),
        ),
        // drawer: ModalRoute.of(context).isFirst ? MainDrawer() : null,
        body: child,
      );
    }
  }
}