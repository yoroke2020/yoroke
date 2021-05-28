import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:yoroke/models/YrkData.dart';
import 'package:yoroke/screens/board/Board.dart';
import 'package:yoroke/screens/find/Find.dart';
import 'package:yoroke/screens/home/Home.dart';
import 'package:yoroke/screens/info/Info.dart';

class RootPage extends StatelessWidget {
  RootPage({this.currentIndex, this.onPushNavigator});
  final int? currentIndex;
  final ValueChanged<YrkData>? onPushNavigator;
  @override
  Widget build(BuildContext context) {
    final List<Widget> children = [
      Home(onPushNavigator: onPushNavigator),
      Board(onPushNavigator: onPushNavigator),
      Find(onPushNavigator: onPushNavigator),
      Info(onPushNavigator: onPushNavigator)
    ];
    return children[currentIndex!];
  }
}
