import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:yoroke/models/YrkData.dart';
import 'package:yoroke/navigator/PageItem.dart';

class AppBarNormal extends StatefulWidget implements PreferredSizeWidget {
  final ValueChanged<YrkData>? onPushNavigator;
  final String? label;

  AppBarNormal({
    Key? key,
    this.onPushNavigator,
    this.label,
  }) : super(
          key: key,
        );

  @override
  State<StatefulWidget> createState() => _AppBarNormalState();

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}

class _AppBarNormalState extends State<AppBarNormal> {
  @override
  Widget build(BuildContext context) {
    return AppBar(
        backgroundColor: const Color(0xffffffff),
        elevation: 0,
        leading: IconButton(
          icon: Image.asset("assets/icons/account_circle_default_24_px.png"),
          onPressed: () {},
        ),
        actions: [
          Container(
            padding: const EdgeInsets.only(right: 8),
            width: 32,
            height: 32,
            child: Image.asset("assets/icons/search_24_px.png"),
          ),
          Container(
            padding: const EdgeInsets.only(right: 8),
            width: 32,
            height: 32,
            child: Image.asset("assets/icons/create_24_px.png"),
          ),
          InkWell(
              onTap: () {
                widget.onPushNavigator!(new YrkData(SubPageItem.notice));
              },
              child: Container(
                padding: const EdgeInsets.only(right: 18),
                width: 42,
                height: 42,
                child: Image.asset("assets/icons/notifications_none_24_px.png"),
              )),
        ],
        title: Text(widget.label ?? ""));
  }
}
