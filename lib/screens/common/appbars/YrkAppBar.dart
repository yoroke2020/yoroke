import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:yoroke/models/YrkData.dart';
import 'package:yoroke/navigator/PageItem.dart';
import 'package:yoroke/screens/common/YrkIconButton.dart';

enum AppBarType { normal, back, searchNoti }

class YrkAppBar extends StatelessWidget implements PreferredSizeWidget {
  final ValueChanged<YrkData>? onPushNavigator;
  final String? label;

  final AppBarType appBarType;

  var context;

  YrkAppBar({
    Key? key,
    this.onPushNavigator,
    this.label,
    this.appBarType = AppBarType.normal,
    this.context,
  }) : super(
          key: key,
        );

  Widget? getLeading() {
    switch (appBarType) {
      case AppBarType.normal:
        return YrkIconButton(
          iconFile: "assets/icons/account_circle_default_36_px.svg",
          iconSize: 32,
          onPressed: () {},
        );
      case AppBarType.back:
        return YrkIconButton(
          iconFile: "assets/icons/icon_arrow_back_24_px.svg",
          iconSize: 32,
          onPressed: () => Navigator.of(context).pop(),
        );
      default:
        break;
    }
  }

  List<Widget> getActions() {
    bool searchButton = false;
    bool createButton = false;
    bool notiButton = false;

    switch (appBarType) {
      case AppBarType.normal:
        searchButton = true;
        createButton = true;
        notiButton = true;
        break;
      case AppBarType.searchNoti:
        searchButton = true;
        notiButton = true;
        break;
      default:
        break;
    }

    List<Widget> ret = [];
    if (searchButton)
      ret.add(
        YrkIconButton(
          iconFile: "assets/icons/icon_search_24_px.svg",
          iconSize: 32,
          onPressed: () {},
        ),
      );
    if (createButton)
      ret.add(YrkIconButton(
        iconFile: "assets/icons/icon_create_24_px.svg",
        iconSize: 32,
        onPressed: () {},
        // color: Colors.yellow,
      ));
    if (notiButton)
      ret.add(
        YrkIconButton(
          iconFile: "assets/icons/icon_notifications_none_24_px.svg",
          iconSize: 32,
          onPressed: () {
            onPushNavigator!(new YrkData(SubPageItem.notice));
          },
        ),
      );
    return ret;
  }

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: const Color(0xffffffff),
      elevation: 0,
      leading: getLeading(),
      actions: getActions(),
      // [
      // YrkIconButton(
      //   iconFile: "assets/icons/icon_search_24_px.svg",
      //   iconSize: 32,
      //   onPressed: () {},
      // ),
      // YrkIconButton(
      //   iconFile: "assets/icons/icon_create_24_px.svg",
      //   iconSize: 32,
      //   onPressed: () {},
      //   // color: Colors.yellow,
      // ),
      // YrkIconButton(
      //   iconFile: "assets/icons/icon_notifications_none_24_px.svg",
      //   iconSize: 32,
      //   onPressed: () {
      //     onPushNavigator!(new YrkData(SubPageItem.notice));
      //   },
      // ),
      // ],
      title: Text(label ?? ""),
    );
  }
}
