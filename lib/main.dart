import 'package:flutter/material.dart';

import 'navigator/PageItem.dart';
import 'navigator/TabNavigator.dart';
import 'views/bottombars/BottomNavigation.dart';

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
  MyMain({Key key}) : super(key: key);

  @override
  _MyMainState createState() => _MyMainState();
}

class _MyMainState extends State<MyMain> {
  BottomNavigation bottomNavigation;
  var _currentPageTab = RootPageItem.home;
  bool isFirst = true;
  final _navigatorKeys = {
    RootPageItem.home: GlobalKey<NavigatorState>(),
    RootPageItem.board: GlobalKey<NavigatorState>(),
    RootPageItem.find: GlobalKey<NavigatorState>(),
    RootPageItem.info: GlobalKey<NavigatorState>(),
  };

  void _onSelectPageTab(RootPageItem rootPageItem) {
    if (rootPageItem == _currentPageTab) {
      _navigatorKeys[rootPageItem].currentState.popUntil((route) => route.isFirst);
    } else {
      setState(() {
        _currentPageTab = rootPageItem;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    bottomNavigation = BottomNavigation.getInstance();
    bottomNavigation.setCurrentRootPageTab(_currentPageTab);
    bottomNavigation.setOnSelectRootPageTab(_onSelectPageTab);

    return WillPopScope(
      onWillPop: () async {
        final isFirstRoutInCurrentPageTab =
            !await _navigatorKeys[_currentPageTab].currentState.maybePop();
        if (isFirstRoutInCurrentPageTab) {
          if (_currentPageTab != RootPageItem.home) {
            _onSelectPageTab(RootPageItem.home);
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
        offstage: _currentPageTab != rootPageItem,
        child: TabNavigator(
          navigatorKey: _navigatorKeys[rootPageItem],
          rootPageItem: rootPageItem,
        ));
  }
}
