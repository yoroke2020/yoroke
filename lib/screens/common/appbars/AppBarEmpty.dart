import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AppBarEmpty extends StatelessWidget implements PreferredSizeWidget {
  static AppBarEmpty? _instance;

  AppBarEmpty._internal(this.preferredSize);

  static AppBarEmpty? getInstance() {
    if (_instance == null)
      _instance = AppBarEmpty._internal(Size.fromHeight(0));
    return _instance;
  }

  @override
  final Size preferredSize;

  @override
  Widget build(BuildContext context) {
    final double statusBarHeight = MediaQuery.of(context).padding.top;

    return Padding(
        padding: new EdgeInsets.only(top: statusBarHeight),
        child: Container());
  }
}
