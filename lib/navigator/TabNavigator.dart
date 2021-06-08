import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:yoroke/temp/YrkData.dart';
import 'package:yoroke/screens/board/Board.dart';
import 'package:yoroke/screens/find/Find.dart';
import 'package:yoroke/screens/home/Home.dart';
import 'package:yoroke/screens/info/Info.dart';

enum RootPageItem { home, board, find, info }

class TabNavigatorRoutes {
  static const String root = '/';
  static const String detail = '/detail';
}

class RootPage extends StatelessWidget {
  RootPage({this.currentIndex, this.onPushNavigator});
  final int? currentIndex;
  final ValueChanged<YrkData>? onPushNavigator;
  @override
  Widget build(BuildContext context) {
    final List<Widget> children = [Home(), Board(), Find(), Info()];
    return children[currentIndex!];
  }
}

// enum RootPageItem { home, board, find, info }

const Map<RootPageItem, String> rootPageTabIconInfo = {
  RootPageItem.home: 'home',
  RootPageItem.board: 'board',
  RootPageItem.find: 'find',
  RootPageItem.info: 'info',
};

const Map<RootPageItem, String> rootPageTabLabelInfo = {
  RootPageItem.home: '홈',
  RootPageItem.board: '자유게시판',
  RootPageItem.find: '시설찾기',
  RootPageItem.info: '정보공유',
};

class TabNavigator extends StatelessWidget {
  TabNavigator({this.navigatorKey, this.rootPageItem});

  final GlobalKey<NavigatorState>? navigatorKey;
  final RootPageItem? rootPageItem;

  void _push(BuildContext context, {YrkData? data}) {
    var routeBuilders = _routeBuilders(context, data: data);
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) =>
            routeBuilders[TabNavigatorRoutes.detail]!(context),
      ),
    );
  }

  Map<String, WidgetBuilder> _routeBuilders(BuildContext context,
      {YrkData? data}) {
    return {
      TabNavigatorRoutes.root: (context) => RootPage(
            currentIndex: rootPageItem!.index,
            onPushNavigator: (data) => _push(context, data: data),
          ),
      // TabNavigatorRoutes.detail: (context) => subpages[rootPageItem!.index]
      // SubPage(
      //       rootIndex: rootPageItem!.index,
      //       data: data,
      //       onPushNavigator: (data) => _push(context, data: data),
      //     )
    };
  }

  @override
  Widget build(BuildContext context) {
    final routeBuilders = _routeBuilders(context);
    return Navigator(
      key: navigatorKey,
      initialRoute: TabNavigatorRoutes.root,
      onGenerateRoute: (routeSettings) {
        return MaterialPageRoute(
            builder: (context) => routeBuilders[routeSettings.name]!(context));
      },
    );
  }
}
