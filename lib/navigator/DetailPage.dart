import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:yoroke/screens/Post.dart';
import 'package:yoroke/screens/board/BoardReview.dart';
import 'package:yoroke/screens/TestPage.dart';
import 'package:yoroke/models/YrkData.dart';
import 'package:yoroke/views/appbars/AppBarEmpty.dart';
import 'package:yoroke/views/appbars/AppBarArrowBack.dart';
import 'package:yoroke/views/appbars/AppBarNormal.dart';
import 'package:yoroke/views/appbars/AppBarYellow.dart';
import 'package:yoroke/views/bottombars/BottomBarComment.dart';
import 'package:yoroke/views/bottombars/BottomBarNavigation.dart';

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
        BoardReview(data: data, onPushNavigator: onPushNavigator),
        Post(data: data),
        Post(data: data),
      ],
      [],
      []
    ];

    PreferredSizeWidget _appBar() {
      switch (data.appBarType) {
        case AppBarType.normal:
          return AppBarNormal.getInstance();
        case AppBarType.yellow:
          return AppBarYellow.getInstance();
        case AppBarType.arrowBack:
          return AppBarArrowBack.getInstance();
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
          BottomBarNavigation bottomBarNavigation =
              BottomBarNavigation.getInstance();
          bottomBarNavigation
              .setCurrentRootPageTab(RootPageItem.values[rootIndex]);
          return bottomBarNavigation;
        case BottomNavigationType.comments:
          return BottomBarComment.getInstance();
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
