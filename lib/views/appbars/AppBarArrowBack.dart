import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AppBarArrowBack extends StatelessWidget implements PreferredSizeWidget {
  static AppBarArrowBack? _instance;

  AppBarArrowBack._internal(this.preferredSize);

  static AppBarArrowBack? getInstance() {
    if (_instance == null)
      _instance = AppBarArrowBack._internal(Size.fromHeight(kToolbarHeight));
    return _instance;
  }

  @override
  final Size preferredSize;

  @override
  Widget build(BuildContext context) {
    final double statusBarHeight = MediaQuery.of(context).padding.top;
    print(MediaQuery.of(context).size.width);
    return Padding(
        padding: EdgeInsets.only(top: statusBarHeight),
        child: Container(
            width: double.maxFinite,
            height: 48,
            decoration: BoxDecoration(color: const Color(0xffffffff)),
            child: Align(
                alignment: Alignment.center,
                child: Row(children: [
                  IconButton(
                    icon: Image.asset(
                      "assets/icons/icon_arrow_back_24_px.png",
                      width: 24,
                      height: 24,
                    ),
                    padding: const EdgeInsets.only(left: 18),
                    constraints: BoxConstraints(),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  ),
                  Expanded(child: Container()),
                ]))));
  }
}
