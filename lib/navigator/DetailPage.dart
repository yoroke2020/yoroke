import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:yoroke/screens/Board.dart';
import 'package:yoroke/screens/board/BoardReview.dart';
import 'package:yoroke/screens/TestPage.dart';
import 'package:yoroke/models/YrkData.dart';
import 'package:yoroke/views/AppBarEmpty.dart';
import 'package:yoroke/views/AppBarNormalTheme.dart';
import 'package:yoroke/views/AppBarYellowTheme.dart';
import 'package:yoroke/views/BottomNavigation.dart';

import 'PageItem.dart';

class DetailPage extends StatelessWidget {
  DetailPage({this.rootIndex, this.data, this.onPushNavigator});

  final int rootIndex;
  final YrkData data;
  final ValueChanged<YrkData> onPushNavigator;

  @override
  Widget build(BuildContext context) {
    AppBarYellowTheme appBarYellowTheme = AppBarYellowTheme.getInstance();
    BottomNavigation bottomNavigation = BottomNavigation.getInstance();
    bottomNavigation.setCurrentRootPageTab(RootPageItem.values[rootIndex]);

    final List<List<Widget>> detailPage = [
      [],
      [
        BoardReview(data, onPushNavigator),
        TestPage(data),
        TestPage(data),
      ],
      [],
      []
    ];

    PreferredSizeWidget _appBar() {
      switch (data.appBarType) {
        case AppBarType.normal:
          return AppBarNormalTheme.getInstance();
        case AppBarType.yellow:
          return AppBarYellowTheme.getInstance();
        case AppBarType.disable:
          return AppBarEmpty.getInstance();
      }
    }

    Widget _body() {

    }

    Widget _bottomNavigationBar() {

    }
    return Scaffold(
        appBar: _appBar(),
        body: detailPage[rootIndex][data.currentSubItemIndex.index],
        bottomNavigationBar: bottomNavigation);
  }
}
