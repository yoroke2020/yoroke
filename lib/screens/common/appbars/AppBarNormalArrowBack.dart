import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:yoroke/models/YrkData.dart';
import 'package:yoroke/navigator/PageItem.dart';
import 'package:yoroke/navigator/SubPage.dart';

class AppBarNormalArrowBack extends StatelessWidget
    implements PreferredSizeWidget {
  AppBarNormalArrowBack({required this.onPushNavigator});

  final ValueChanged<YrkData> onPushNavigator;

  @override
  Size get preferredSize => Size.fromHeight(48.0);

  @override
  Widget build(BuildContext context) {
    return Container(
        width: double.maxFinite,
        height: 48.0,
        margin: EdgeInsets.symmetric(horizontal: 16.0),
        decoration: BoxDecoration(color: const Color(0xffffffff)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            InkWell(
              child: Padding(
                padding: EdgeInsets.zero,
                child: Image.asset(
                  "assets/icons/icon_arrow_back_24_px.png",
                  width: 24.0,
                  height: 24.0,
                ),
              ),
              onTap: () => Navigator.pop(context),
            ),
            Spacer(),
            InkWell(
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 4.0),
                  child: Image.asset(
                    "assets/icons/search_24_px.png",
                    width: 24.0,
                    height: 24.0,
                  ),
                ),
                onTap: () => print("AppBarNormalArrowBack search pressed")),
            InkWell(
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 4.0),
                  child: Image.asset(
                    "assets/icons/create_24_px.png",
                    width: 24.0,
                    height: 24.0,
                  ),
                ),
                onTap: () => onPushNavigator(
                    new YrkData(SubPageItem.createPost, str0: "후기"))),
            InkWell(
                child: Padding(
                  padding: EdgeInsets.only(left: 4.0),
                  child: Image.asset(
                    "assets/icons/notifications_none_24_px.png",
                    width: 24.0,
                    height: 24.0,
                  ),
                ),
                onTap: () =>
                    print("AppBarNormalArrowBack notification pressed")),
          ],
        ));
  }
}
