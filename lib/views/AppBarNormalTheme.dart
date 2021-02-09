import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AppBarNormalTheme extends StatefulWidget implements PreferredSizeWidget {
  static AppBarNormalTheme _instance;

  AppBarNormalTheme._internal(this.preferredSize);

  static AppBarNormalTheme getInstance() {
    if (_instance == null)
      _instance = AppBarNormalTheme._internal(Size.fromHeight(kToolbarHeight));
    return _instance;
  }

  @override
  final Size preferredSize;

  @override
  _AppBarNormalThemeState createState() => _AppBarNormalThemeState();
}

class _AppBarNormalThemeState extends State<AppBarNormalTheme> {
  @override
  Widget build(BuildContext context) {
    final double statusBarHeight = MediaQuery.of(context).padding.top;

    return Padding(
      padding: new EdgeInsets.only(top: statusBarHeight),
      child: Container(
        width: double.maxFinite,
        height: 48,
        decoration: BoxDecoration(color: const Color(0xffffffff)),
        child: Align(
            alignment: Alignment.center,
            child: Row(
              children: [
                Center(
                  child: Container(
                    padding: const EdgeInsets.only(left: 18),
                    width: 50,
                    height: 32,
                    child: Image.asset(
                        "assets/icons/account_circle_default_24_px.png"),
                  ),
                ),
                Expanded(child: Container()),
                Center(
                  child: Container(
                    padding: const EdgeInsets.only(right: 8),
                    width: 32,
                    height: 24,
                    child: Image.asset("assets/icons/search_24_px.png"),
                  ),
                ),
                Center(
                  child: Container(
                    padding: const EdgeInsets.only(right: 8),
                    width: 32,
                    height: 24,
                    child: Image.asset("assets/icons/create_24_px.png"),
                  ),
                ),
                Center(
                  child: Container(
                    padding: const EdgeInsets.only(right: 18),
                    width: 42,
                    height: 24,
                    child: Image.asset(
                        "assets/icons/notifications_none_24_px.png"),
                  ),
                ),
              ],
            ))));
  }
}
