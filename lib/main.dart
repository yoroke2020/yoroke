import 'package:flutter/material.dart';

import 'navigator/PageItem.dart';
import 'navigator/TabNavigator.dart';
import 'views/bottombars/BottomBarNavigation.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Yoroke 2020',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
        scaffoldBackgroundColor: const Color(0xffffffff),
      ),
      home: MyMain(),
    );
  }
}

class MyMain extends StatefulWidget {
  MyMain({Key? key}) : super(key: key);

  @override
  _MyMainState createState() => _MyMainState();
}

class _MyMainState extends State<MyMain> {
  BottomBarNavigation? bottomBarNavigation;
  var _curPageItem = RootPageItem.home;
  bool isFirst = true;
  final _navigatorKeys = {
    RootPageItem.home: GlobalKey<NavigatorState>(),
    RootPageItem.board: GlobalKey<NavigatorState>(),
    RootPageItem.find: GlobalKey<NavigatorState>(),
    RootPageItem.info: GlobalKey<NavigatorState>(),
  };

  void _onSelectPageItem(RootPageItem rootPageItem) {
    _navigatorKeys[_curPageItem]!.currentState!.popUntil((route) => route.isFirst);
    if (rootPageItem == _curPageItem) {
      _navigatorKeys[rootPageItem]!.currentState!.popUntil((route) => route.isFirst);
    } else {
      setState(() {
        _curPageItem = rootPageItem;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    bottomBarNavigation = BottomBarNavigation.getInstance(_curPageItem);
    bottomBarNavigation!.setOnSelectRootPageItem(_onSelectPageItem);

    return WillPopScope(
      onWillPop: () async {
        final isFirstRoutInCurrentPageTab =
            !await _navigatorKeys[_curPageItem]!.currentState!.maybePop();
        if (isFirstRoutInCurrentPageTab) {
          if (_curPageItem != RootPageItem.home) {
            _onSelectPageItem(RootPageItem.home);
            return false;
          }
        }
        return isFirstRoutInCurrentPageTab;
      },
      child: Stack(
        children: <Widget>[
          _buildOffstageNavigator(RootPageItem.home),
          _buildOffstageNavigator(RootPageItem.board),
          _buildOffstageNavigator(RootPageItem.find),
          _buildOffstageNavigator(RootPageItem.info),
        ],
      ),
    );
  }

  _buildOffstageNavigator(RootPageItem rootPageItem) {
    return Offstage(
        offstage: _curPageItem != rootPageItem,
        child: TabNavigator(
          navigatorKey: _navigatorKeys[rootPageItem],
          rootPageItem: rootPageItem,
        ));
  }
}
