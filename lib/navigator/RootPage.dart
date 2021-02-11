import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:yoroke/navigator/PageItem.dart';
import 'package:yoroke/screens/Board.dart';
import 'package:yoroke/screens/Find.dart';
import 'package:yoroke/screens/Home.dart';
import 'package:yoroke/screens/Info.dart';
import 'package:yoroke/models/YrkData.dart';
import 'package:yoroke/views/appbars/AppBarNormalTheme.dart';
import 'package:yoroke/views/bottombars/BottomNavigation.dart';

class RootPage extends StatelessWidget {
  RootPage({this.currentIndex, this.onPushNavigator});

  final int currentIndex;
  final ValueChanged<YrkData> onPushNavigator;

  @override
  Widget build(BuildContext context) {
    AppBarNormalTheme appBarNormalTheme = AppBarNormalTheme.getInstance();
    BottomNavigation bottomNavigation = BottomNavigation.getInstance();
    bottomNavigation.setCurrentRootPageTab(RootPageItem.values[currentIndex]);

    final List<Widget> children = [
      Home(),
      Board(onPushNavigator: onPushNavigator),
      Find(),
      Info()
    ];

    return Scaffold(
      backgroundColor: const Color(0xffffffff),
        appBar: appBarNormalTheme,
        body: children[currentIndex],
        bottomNavigationBar: bottomNavigation
    ) ;
  }
}
