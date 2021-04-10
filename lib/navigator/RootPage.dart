import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:yoroke/navigator/PageItem.dart';
import 'package:yoroke/screens/Board.dart';
import 'package:yoroke/screens/Find.dart';
import 'package:yoroke/screens/Home.dart';
import 'package:yoroke/screens/Info.dart';
import 'package:yoroke/models/YrkData.dart';
import 'package:yoroke/views/appbars/AppBarNormal.dart';
import 'package:yoroke/views/bottombars/BottomBarNavigation.dart';

class RootPage extends StatelessWidget {
  RootPage({this.currentIndex, this.onPushNavigator});

  final int? currentIndex;
  final ValueChanged<YrkData>? onPushNavigator;

  @override
  Widget build(BuildContext context) {
    AppBarNormal? appBarNormal = AppBarNormal.getInstance();
    BottomBarNavigation? bottomBarNavigation =
        BottomBarNavigation.getInstance(RootPageItem.values[currentIndex!]);

    final List<Widget> children = [
      Home(onPushNavigator: onPushNavigator),
      Board(onPushNavigator: onPushNavigator),
      Find(),
      Info()
    ];

    return Scaffold(
        backgroundColor: const Color(0xffffffff),
        appBar: appBarNormal,
        body: children[currentIndex!],
        bottomNavigationBar: bottomBarNavigation);
  }
}
