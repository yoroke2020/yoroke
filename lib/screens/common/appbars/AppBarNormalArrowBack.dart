import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AppBarNormalArrowBack extends StatelessWidget
    implements PreferredSizeWidget {
  @override
  Size get preferredSize => Size.fromHeight(48.0);

  @override
  Widget build(BuildContext context) {
    return Container(
        width: double.maxFinite,
        height: 48.0,
        padding: EdgeInsets.symmetric(horizontal: 8.0),
        decoration: BoxDecoration(color: const Color(0xffffffff)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            IconButton(
              icon: Image.asset(
                "assets/icons/icon_arrow_back_24_px.png",
                width: 24.0,
                height: 24.0,
              ),
              onPressed: () => Navigator.pop(context),
            ),
            Expanded(child: Container()),
            Container(
                margin: EdgeInsets.symmetric(horizontal: 4.0),
                child: IconButton(
                  icon: Image.asset(
                    "assets/icons/search_24_px.png",
                    width: 24.0,
                    height: 24.0,
                  ),
                  onPressed: () =>
                      print("AppBarNormalArrowBack search pressed"),
                )),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 4.0),
              child: IconButton(
                icon: Image.asset(
                  "assets/icons/create_24_px.png",
                  width: 24.0,
                  height: 24.0,
                ),
                onPressed: () => print("AppBarNormalArrowBack create pressed"),
              ),
            ),
            Container(
              margin: EdgeInsets.only(left: 4.0),
              child: IconButton(
                icon: Image.asset(
                  "assets/icons/notifications_none_24_px.png",
                  width: 24.0,
                  height: 24.0,
                ),
                onPressed: () =>
                    print("AppBarNormalArrowBack notification pressed"),
              ),
            ),
          ],
        ));
  }
}
