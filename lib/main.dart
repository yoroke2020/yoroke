import 'package:flutter/material.dart';

import 'navigator/TabItem.dart';
import 'navigator/TabNavigator.dart';
import 'views/BottomNavigation.dart';

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
  var _currentTab = TabItem.home;
  bool isFirst = true;
  final _navigatorKeys = {
    TabItem.home: GlobalKey<NavigatorState>(),
    TabItem.board: GlobalKey<NavigatorState>(),
    TabItem.find: GlobalKey<NavigatorState>(),
    TabItem.info: GlobalKey<NavigatorState>(),
  };

  void _selectTab(TabItem tabItem) {
    if (tabItem == _currentTab) {
      _navigatorKeys[tabItem].currentState.popUntil((route) => route.isFirst);
    } else {
      setState(() {
        _currentTab = tabItem;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    bottomNavigation = BottomNavigation.getInstance();
    bottomNavigation.setCurrentTab(_currentTab, false);
    bottomNavigation.setSelectTab(_selectTab);

    return WillPopScope(
        onWillPop: () async {
          final isFirstRoutInCurrentTab =
              !await _navigatorKeys[_currentTab].currentState.maybePop();
          if (isFirstRoutInCurrentTab) {
            if (_currentTab != TabItem.home) {
              _selectTab(TabItem.home);
              return false;
            }
          }
          return isFirstRoutInCurrentTab;
        },
        child: Scaffold(
          appBar: PreferredSize(
              preferredSize: Size.fromHeight(10.0),
              child: AppBar(
                toolbarHeight: 10,
              )),
          body: Stack(children: <Widget>[
            _buildOffstageNavigator(TabItem.home),
            _buildOffstageNavigator(TabItem.board),
            _buildOffstageNavigator(TabItem.find),
            _buildOffstageNavigator(TabItem.info),
          ],),
            bottomNavigationBar: bottomNavigation,
        ));
  }

  _buildOffstageNavigator(TabItem tabItem) {
    return Offstage(
      offstage: _currentTab != tabItem,
      child: TabNavigator(
          navigatorKey: _navigatorKeys[tabItem],
        tabItem: tabItem,
      )
      );
  }
}
