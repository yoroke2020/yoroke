import 'package:flutter/material.dart';
import 'package:yoroke/controllers/ProfileController.dart';
import 'package:yoroke/screens/common/YrkDrawer.dart';
import 'package:yoroke/screens/common/bottombars/BottomBarNavigation.dart';

import 'navigator/PageItem.dart';
import 'navigator/TabNavigator.dart';

void main() {
  runApp(MyApp());
}

final ProfileController profileController = ProfileController();
final YrkDrawer yrkDrawer = YrkDrawer();

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Yoroke 2020',
      theme: ThemeData(
          primarySwatch: MaterialColor(0xfff5df4d, const <int, Color>{
            50: const Color(0xfff5df4d),
            100: const Color(0xfff5df4d),
            200: const Color(0xfff5df4d),
            300: const Color(0xfff5df4d),
            400: const Color(0xfff5df4d),
            500: const Color(0xfff5df4d),
            600: const Color(0xfff5df4d),
            700: const Color(0xfff5df4d),
            800: const Color(0xfff5df4d),
            900: const Color(0xfff5df4d),
          }),
          visualDensity: VisualDensity.adaptivePlatformDensity,
          scaffoldBackgroundColor: const Color(0xffffffff),
          textSelectionTheme: TextSelectionThemeData(
            cursorColor: const Color(0xfff5df4d),
          )),
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
    _navigatorKeys[_curPageItem]!
        .currentState!
        .popUntil((route) => route.isFirst);
    if (rootPageItem == _curPageItem) {
      _navigatorKeys[rootPageItem]!
          .currentState!
          .popUntil((route) => route.isFirst);
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
