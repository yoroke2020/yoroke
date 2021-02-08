import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:yoroke/navigator/TabItem.dart';
import 'package:yoroke/screens/Board.dart';
import 'package:yoroke/screens/Find.dart';
import 'package:yoroke/screens/Home.dart';
import 'package:yoroke/screens/Info.dart';
import 'package:yoroke/models/YrkData.dart';
import 'package:yoroke/views/BottomNavigation.dart';

class RootPage extends StatelessWidget {
  RootPage({this.currentIndex, this.onPushNavigator});

  final int currentIndex;
  final ValueChanged<YrkData> onPushNavigator;

  @override
  Widget build(BuildContext context) {
    BottomNavigation bottomNavigation = BottomNavigation.getInstance();
    bottomNavigation.setCurrentTab(TabItem.values[currentIndex], true);
    final List<Widget> children = [
      Home(),
      Board(onPushNavigator: onPushNavigator),
      Find(),
      Info()
    ];

    return Scaffold(
        appBar: PreferredSize(
            preferredSize: Size.fromHeight(10.0),
            child: AppBar(
              toolbarHeight: 10,
            )),
        body: children[currentIndex],
        bottomNavigationBar: bottomNavigation
    ) ;
  }
}
