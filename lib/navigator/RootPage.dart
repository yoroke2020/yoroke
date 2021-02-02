import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:helloflutter/screens/Board.dart';
import 'package:helloflutter/screens/Find.dart';
import 'package:helloflutter/screens/Home.dart';
import 'package:helloflutter/screens/Info.dart';
import 'package:helloflutter/tools/Data.dart';

class RootPage extends StatelessWidget {
  RootPage({this.currentIndex, this.onPushNavigator});

  final int currentIndex;
  final ValueChanged<Data> onPushNavigator;

  @override
  Widget build(BuildContext context) {
    final List<Widget> children = [
      Home(),
      Board(onPushNavigator: onPushNavigator),
      Find(),
      Info()
    ];

    return children[currentIndex];
  }
}
