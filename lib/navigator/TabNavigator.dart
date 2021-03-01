import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:yoroke/models/YrkData.dart';

import 'SubPage.dart';
import 'RootPage.dart';
import 'PageItem.dart';

class TabNavigatorRoutes {
  static const String root = '/';
  static const String detail = '/detail';
}

class TabNavigator extends StatelessWidget {
  TabNavigator({this.navigatorKey, this.rootPageItem});

  final GlobalKey<NavigatorState> navigatorKey;
  final RootPageItem rootPageItem;

  void _push(BuildContext context, {YrkData data}) {
    var routeBuilders = _routeBuilders(context, data: data);

    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => routeBuilders[TabNavigatorRoutes.detail](context),
      ),
    );
  }

  Map<String, WidgetBuilder> _routeBuilders(BuildContext context,
      {YrkData data}) {
    return {
      TabNavigatorRoutes.root: (context) => RootPage(
            currentIndex: rootPageItem.index,
            onPushNavigator: (data) => _push(context, data: data),
          ),
      TabNavigatorRoutes.detail: (context) => SubPage(
            rootIndex: rootPageItem.index,
            data: data,
            onPushNavigator: (data) => _push(context, data: data),
          )
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
            builder: (context) => routeBuilders[routeSettings.name](context));
      },
    );
  }
}
