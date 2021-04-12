import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AppBarNormal extends StatefulWidget implements PreferredSizeWidget {
  static AppBarNormal? _instance;

  AppBarNormal._internal(this.preferredSize);

  static AppBarNormal? getInstance() {
    if (_instance == null)
      _instance = AppBarNormal._internal(Size.fromHeight(kToolbarHeight));
    return _instance;
  }

  @override
  final Size preferredSize;

  @override
  _AppBarNormalState createState() => _AppBarNormalState();
}

class _AppBarNormalState extends State<AppBarNormal> {
  @override
  Widget build(BuildContext context) {
    final double statusBarHeight = MediaQuery.of(context).padding.top;

    return Padding(
      padding: EdgeInsets.only(top: statusBarHeight),
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