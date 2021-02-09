import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AppBarYellowTheme extends StatefulWidget implements PreferredSizeWidget {
  static AppBarYellowTheme _instance;

  AppBarYellowTheme._internal(this.preferredSize);

  static AppBarYellowTheme getInstance() {
    if (_instance == null)
      _instance = AppBarYellowTheme._internal(Size.fromHeight(kToolbarHeight));
    return _instance;
  }

  @override
  final Size preferredSize;

  @override
  _AppBarYellowThemeState createState() => _AppBarYellowThemeState();
}

class _AppBarYellowThemeState extends State<AppBarYellowTheme> {
  @override
  Widget build(BuildContext context) {
    final double statusBarHeight = MediaQuery.of(context).padding.top;

    return Padding(
        padding: new EdgeInsets.only(top: statusBarHeight),
        child: Container(
            height: 48,
            child: Row(children: [
              IconButton(
                icon: Image.asset(
                  "assets/icons/icon_back_color_24_px.png",
                  height: 24,
                  width: 24,
                ),
                padding: EdgeInsets.only(left: 16),
                constraints: BoxConstraints(),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
              Expanded(child: Container()),
              IconButton(
                icon: Image.asset(
                  "assets/icons/icon_search_color_24_px.png",
                  height: 24,
                  width: 24,
                ),
                padding: EdgeInsets.only(right: 8),
                constraints: BoxConstraints(),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
              IconButton(
                icon: Image.asset(
                  "assets/icons/icon_create_color_24_px.png",
                  height: 24,
                  width: 24,
                ),
                padding: EdgeInsets.only(right: 8),
                constraints: BoxConstraints(),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
              IconButton(
                icon: Image.asset(
                  "assets/icons/icon_notification_color_24_px.png",
                  height: 24,
                  width: 24,
                ),
                padding: EdgeInsets.only(right: 16),
                constraints: BoxConstraints(),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
            ])));
  }
}
