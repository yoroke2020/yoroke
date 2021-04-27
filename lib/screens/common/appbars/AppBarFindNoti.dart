import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:yoroke/models/YrkData.dart';
import 'package:yoroke/navigator/PageItem.dart';
import 'package:yoroke/screens/common/YrkTextStyle.dart';

class AppBarFindNoti extends StatefulWidget implements PreferredSizeWidget {
  final ValueChanged<YrkData>? onPushNavigator;
  final String? label;
  AppBarFindNoti({
    Key? key,
    this.onPushNavigator,
    this.label,
  }) : super(key: key);

  @override
  _AppBarFindNotiState createState() => _AppBarFindNotiState();

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}

class _AppBarFindNotiState extends State<AppBarFindNoti> {
  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: const Color(0xffffffff),
      elevation: 0,
      actions: [
        Container(
          padding: const EdgeInsets.only(right: 8),
          width: 32,
          height: 32,
          child: Image.asset("assets/icons/search_24_px.png"),
        ),
        InkWell(
            onTap: () {
              print("h");
              widget.onPushNavigator!(new YrkData(SubPageItem.notice));
            },
            child: Container(
              padding: const EdgeInsets.only(right: 18),
              width: 42,
              height: 42,
              child: Image.asset("assets/icons/notifications_none_24_px.png"),
            )),
      ],
      title: Text(
        widget.label ?? "",
        style: YrkTextStyle(
          fontSize: 22,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
