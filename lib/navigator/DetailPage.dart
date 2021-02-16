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
    AppBarType appBarType = AppBarType.disable;
    BottomBarType bottomBarType = BottomBarType.disable;

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
      switch (appBarType) {
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

    _bottomNavigationBar() {
      switch (bottomBarType) {
        case BottomBarType.normal:
          BottomBarNavigation bottomBarNavigation =
              BottomBarNavigation.getInstance();
          bottomBarNavigation
              .setCurrentRootPageTab(RootPageItem.values[rootIndex]);
          return bottomBarNavigation;
        case BottomBarType.comments:
          return BottomBarComment.getInstance();
        case BottomBarType.disable:
          return Container();
      }
    }

    Widget _body() {
      return detailPage[rootIndex][data.nextPageItem.index];
    }

    switch (rootIndex) {
      case 0:
        break;
      case 1:
        switch (data.nextPageItem) {
          case SubPageItem.boardReview:
            appBarType = AppBarType.disable;
            bottomBarType = BottomBarType.normal;
            break;
          case SubPageItem.boardQna:
            appBarType = AppBarType.arrowBack;
            bottomBarType = BottomBarType.comments;
            break;
          case SubPageItem.boardJobFinding:
            appBarType = AppBarType.arrowBack;
            bottomBarType = BottomBarType.comments;
            break;
        }
        break;
      case 2:
        break;
      case 3:
        break;
    }

    return Scaffold(
        appBar: _appBar(),
        body: _body(),
        bottomNavigationBar: _bottomNavigationBar());
  }
}
