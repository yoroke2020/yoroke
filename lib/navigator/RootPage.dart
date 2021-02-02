import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:yoroke/screens/Board.dart';
import 'package:yoroke/screens/Find.dart';
import 'package:yoroke/screens/Home.dart';
import 'package:yoroke/screens/Info.dart';
import 'package:yoroke/models/YrkData.dart';

class RootPage extends StatelessWidget {
  RootPage({this.currentIndex, this.onPushNavigator});

  final int currentIndex;
  final ValueChanged<YrkData> onPushNavigator;

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
