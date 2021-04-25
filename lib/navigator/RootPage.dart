import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:yoroke/models/YrkData.dart';
import 'package:yoroke/navigator/PageItem.dart';
import 'package:yoroke/screens/board/Board.dart';
import 'package:yoroke/screens/common/appbars/AppBarNormal.dart';
import 'package:yoroke/screens/common/bottombars/BottomBarNavigation.dart';
import 'package:yoroke/screens/find/Find.dart';
import 'package:yoroke/screens/home/Home.dart';
import 'package:yoroke/screens/info/Info.dart';

class RootPage extends StatelessWidget {
  RootPage({this.currentIndex, this.onPushNavigator});
  final int? currentIndex;
  final ValueChanged<YrkData>? onPushNavigator;
  @override
  Widget build(BuildContext context) {
    AppBarNormal? appBarNormal = AppBarNormal(
      onPushNavigator: this.onPushNavigator,
    );
    BottomBarNavigation? bottomBarNavigation =
        BottomBarNavigation.getInstance(RootPageItem.values[currentIndex!]);
    final List<Widget> children = [
      Home(onPushNavigator: onPushNavigator),
      Board(onPushNavigator: onPushNavigator),
      Find(),
      Info(onPushNavigator: onPushNavigator)
    ];
    return Scaffold(
        backgroundColor: const Color(0xffffffff),
        appBar: PreferredSize(
          child: appBarNormal,
          preferredSize: Size.fromHeight(56.0),
        ),
        body: children[currentIndex!],
        bottomNavigationBar: bottomBarNavigation);
  }
}
