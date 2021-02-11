import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:yoroke/screens/board/BoardReview.dart';
import 'package:yoroke/screens/TestPage.dart';
import 'package:yoroke/models/YrkData.dart';
import 'package:yoroke/views/appbars/AppBarEmpty.dart';
import 'package:yoroke/views/appbars/AppBarLeftArrow.dart';
import 'package:yoroke/views/appbars/AppBarNormalTheme.dart';
import 'package:yoroke/views/appbars/AppBarYellowTheme.dart';
import 'package:yoroke/views/bottombars/BottomComment.dart';
import 'package:yoroke/views/bottombars/BottomNavigation.dart';

import 'PageItem.dart';

class DetailPage extends StatelessWidget {
  DetailPage({this.rootIndex, this.data, this.onPushNavigator});

  final int rootIndex;
  final YrkData data;
  final ValueChanged<YrkData> onPushNavigator;

  @override
  Widget build(BuildContext context) {
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
        case AppBarType.arrowBack:
          return AppBarLeftArrow.getInstance();
        case AppBarType.disable:
          return AppBarEmpty.getInstance();
      }
    }

    Widget _body() {
      return detailPage[rootIndex][data.currentSubItemIndex.index];
    }

    _bottomNavigationBar() {
      switch (data.bottomNavigationType) {
        case BottomNavigationType.normal:
          BottomNavigation bottomNavigation = BottomNavigation.getInstance();
          bottomNavigation
              .setCurrentRootPageTab(RootPageItem.values[rootIndex]);
          return bottomNavigation;
        case BottomNavigationType.comments:
          return BottomCommentBar.getInstance();
        case BottomNavigationType.disable:
          return Container();
      }
    }

    return Scaffold(
        appBar: _appBar(),
        body: _body(),
        bottomNavigationBar: _bottomNavigationBar());
  }
}
